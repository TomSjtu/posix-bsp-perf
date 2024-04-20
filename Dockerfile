FROM ubuntu:20.04

# 安装必要的软件包和交叉编译工具链
# RUN apt-get update && \
#    apt-get install -y cmake make git vim gcc g++ gdb gdbserver && \
#    apt-get install -y autoconf automake pkg-config libssl-dev libboost-all-dev ncurses-dev nfs-common && \
#    apt-get install -y net-tools openssh-server openssh-client && \
#    apt-get install -y build-essential libgtest-dev libgmock-dev libmosquitto-dev libdbus-1-dev libprotobuf-dev protobuf-compiler

# 创建一个新用户 'build'，您可以替换为您想要的用户名
# RUN useradd -m -d /home/build -s /bin/bash build

# 切换到新用户
# USER build

# 设置工作目录
WORKDIR /home/build