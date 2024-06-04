#ifndef TCP_CONNECTION_HPP
#define TCP_CONNECTION_HPP

#include <bsp_sockets/EventLoop.hpp>
#include <bsp_sockets/ISocketConnection.hpp>
#include <shared/BspLogger.hpp>
#include "IOBuffer.hpp"

#include <memory>

namespace bsp_sockets
{

class TcpServer;

class TcpConnection: public ISocketConnection
{
public:
    TcpConnection(int conn_fd, std::shared_ptr<EventLoop> loop, std::shared_ptr<TcpServer> server);

    void activate(int conn_fd, std::shared_ptr<EventLoop> loop);

    void handleRead();

    void handleWrite();

    virtual int sendData(std::span<const uint8_t> data, int datlen, int cmdid) override;

    virtual int getFd() override { return m_connection_fd; }

    void cleanConnection();

private:
    int m_connection_fd{-1};
    std::shared_ptr<EventLoop> m_loop{nullptr};
    std::weak_ptr<TcpServer> m_tcp_server{nullptr};
    input_buffer m_in_buf{};
    output_buffer m_out_buf{};

    std::unique_ptr<bsp_perf::shared::BspLogger> m_logger;
};

}


#endif