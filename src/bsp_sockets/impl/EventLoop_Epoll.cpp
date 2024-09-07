#include <bsp_sockets/EventLoop_Epoll.hpp>
#include "BspSocketException.hpp"
#include "TimerQueue.hpp"

#include <sys/epoll.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <errno.h>
#include <time.h>

#include <string>
#include <memory>
#include <vector>
#include <cstring>
#include <cerrno>
#include <any>

namespace bsp_sockets
{
using namespace bsp_perf::shared;

EventLoop_Epoll::EventLoop_Epoll():
    m_epoll_fd{::epoll_create1(0)}
{
    if (m_epoll_fd < 0)
    {
        throw BspSocketException("epoll_create1");
    }

    auto timerQueueCallback = [](std::shared_ptr<EventLoop> loop, int fd, std::any args)
    {
        std::vector<timerEvent> fired_evs;
        auto& tq = loop->getTimerQueue();
        tq->getFiredTimerEvents(fired_evs);
        for (std::vector<timerEvent>::iterator it = fired_evs.begin();
            it != fired_evs.end(); ++it)
        {
            it->cb(loop, it->cb_data);
        }
    };

    addIoEvent(m_timer_queue->getNotifier(), timerQueueCallback, EPOLLIN, m_timer_queue);
}

void EventLoop_Epoll::processEvents()
{
    while (true)
    {
        thread_local size_t tid = std::hash<std::thread::id>{}(std::this_thread::get_id());
        int nfds = ::epoll_wait(m_epoll_fd, m_fired_events, MAX_EVENTS, 10);
        for (int i = 0; i < nfds; ++i)
        {
            ioevIterator it = m_io_events.find(m_fired_events[i].data.fd);
            assert(it != m_io_events.end());
            auto& ev = it->second;

            if (m_fired_events[i].events & EPOLLIN)
            {
                std::any args = ev.rcb_args;
                ev.read_callback(shared_from_this(), m_fired_events[i].data.fd, args);
            }
            else if (m_fired_events[i].events & EPOLLOUT)
            {
                std::any args = ev.wcb_args;
                ev.write_callback(shared_from_this(), m_fired_events[i].data.fd, args);
            }
            else if (m_fired_events[i].events & (EPOLLHUP | EPOLLERR))
            {
                if (ev.read_callback)
                {
                    std::any args = ev.rcb_args;
                    ev.read_callback(shared_from_this(), m_fired_events[i].data.fd, args);
                }
                else if (ev.write_callback)
                {
                    std::any args = ev.wcb_args;
                    ev.write_callback(shared_from_this(), m_fired_events[i].data.fd, args);
                }
                else
                {
                    m_logger->printStdoutLog(BspLogger::LogLevel::Error, "fd {} get error, delete it from epoll", m_fired_events[i].data.fd);
                    delIoEvent(m_fired_events[i].data.fd);
                }
            }
        }
        runTask();
    }
}

/*
 * if EPOLLIN in mask, EPOLLOUT must not in mask;
 * if EPOLLOUT in mask, EPOLLIN must not in mask;
 * if want to register EPOLLOUT | EPOLLIN event, just call add_ioev twice!
 */
void EventLoop_Epoll::addIoEvent(int fd, ioCallback proc, int mask, std::any args)
{
    int f_mask = 0;
    int op;
    ioevIterator it = m_io_events.find(fd);
    if (it == m_io_events.end())
    {
        f_mask = mask;
        op = EPOLL_CTL_ADD;
    }
    else
    {
        f_mask = it->second.mask | mask;
        op = EPOLL_CTL_MOD;
    }
    if (mask & EPOLLIN)
    {
        m_io_events[fd].read_callback = proc;
        m_io_events[fd].rcb_args = args;
    }
    else if (mask & EPOLLOUT)
    {
        m_io_events[fd].write_callback = proc;
        m_io_events[fd].wcb_args = args;
    }

    m_io_events[fd].mask = f_mask;
    struct epoll_event event;
    event.events = f_mask;
    event.data.fd = fd;
    int ret = ::epoll_ctl(m_epoll_fd, op, fd, &event);
    if (ret == -1)
    {
        int errnum = errno;
        m_logger->printStdoutLog(BspLogger::LogLevel::Error, "EventLoop::addIoEvent epoll_ctl ret:{}, m_epoll_fd:{}, fd:{}, Error num: {}",
                    ret, m_epoll_fd, fd, strerror(errnum));
        throw BspSocketException("epoll_ctl");
    }
    m_listening.insert(fd); //加入到监听集合中
}

void EventLoop_Epoll::delIoEvent(int fd, int mask)
{
    ioevIterator it = m_io_events.find(fd);
    if (it == m_io_events.end())
    {
        return ;
    }
    int& o_mask = it->second.mask;
    int ret;
    o_mask = o_mask & (~mask);
    if (o_mask == 0)
    {
        m_io_events.erase(it);
        ret = ::epoll_ctl(m_epoll_fd, EPOLL_CTL_DEL, fd, NULL);
        if (ret == -1)
        {
        int errnum = errno;
        m_logger->printStdoutLog(BspLogger::LogLevel::Error, "EventLoop::delIoEvent EPOLL_CTL_DEL ret:{}, m_epoll_fd:{}, fd:{}, Error num: {}",
                    ret, m_epoll_fd, fd, strerror(errnum));
            throw BspSocketException("epoll_ctl EPOLL_CTL_DEL");
        }
        m_listening.erase(fd);//从监听集合中删除
    }
    else
    {
        struct epoll_event event;
        event.events = o_mask;
        event.data.fd = fd;
        ret = ::epoll_ctl(m_epoll_fd, EPOLL_CTL_MOD, fd, &event);
        if (ret == -1)
        {
            int errnum = errno;
            m_logger->printStdoutLog(BspLogger::LogLevel::Error, "EventLoop::delIoEvent EPOLL_CTL_MOD ret:{}, m_epoll_fd:{}, fd:{}, Error num: {}",
                        ret, m_epoll_fd, fd, strerror(errnum));
            throw BspSocketException("epoll_ctl EPOLL_CTL_MOD");
        }
    }
}

void EventLoop_Epoll::delIoEvent(int fd)
{
    ioevIterator it = m_io_events.find(fd);
    if (it == m_io_events.end())
    {
        return;
    }
    m_io_events.erase(it);
    m_listening.erase(fd);
    int ret = ::epoll_ctl(m_epoll_fd, EPOLL_CTL_DEL, fd, NULL);
    if (ret == -1)
    {
        int errnum = errno;
        m_logger->printStdoutLog(BspLogger::LogLevel::Error, "EventLoop::delIoEvent EPOLL_CTL_DEL ret:{}, m_epoll_fd:{}, fd:{}, Error num: {}",
                    ret, m_epoll_fd, fd, strerror(errnum));
        throw BspSocketException("epoll_ctl EPOLL_CTL_DEL");
    }
}

} //namespace bsp_sockets

