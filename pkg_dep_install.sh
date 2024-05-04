#!/bin/bash

# Install gstreamer
sudo apt install gstreamer

# Install perf
sudo apt install perf

# Install bpf
sudo apt install bpf

# Install other third-party packages
sudo apt install package1 package2 package3

# Add any additional packages you want to install here

echo "Package installation complete."

# Docker build 3rd party packages

# build spdlog

## for x86
cmake .. -DCMAKE_INSTALL_PREFIX=/opt/cross_env/x86/install -DSPDLOG_BUILD_BENCH=ON -DSPDLOG_BUILD_SHARED=ON

## for rk3588s
cmake .. -DCMAKE_INSTALL_PREFIX=/opt/cross_env/rk3588s/install -DSPDLOG_BUILD_BENCH=ON -DSPDLOG_BUILD_SHARED=ON

make -j8 install

# build cpp-tbox
## for x86
cmake .. -DCMAKE_INSTALL_PREFIX=/opt/cross_env/x86/install

## for rk3588s
cmake .. -DCMAKE_INSTALL_PREFIX=/opt/cross_env/rk3588s/install

make -j8 install

# build cli11

## for x86
cmake .. -DCMAKE_INSTALL_PREFIX=/opt/cross_env/x86/install
## for rk3588s
cmake .. -DCMAKE_INSTALL_PREFIX=/opt/cross_env/rk3588s/install

make -j8 install

# build posix-bsp-perf

# for X86

cmake -DBSP_PKG_CONFIG_PATH=/opt/cross_env/x86/install/lib/pkgconfig -DCMAKE_BUILD_TYPE=Debug  ..

cmake -DBSP_PKG_CONFIG_PATH=/opt/cross_env/x86/install/lib/pkgconfig -DCMAKE_BUILD_TYPE=Release ..


make -j8 install

# for rk3588s

cmake -DBSP_PKG_CONFIG_PATH=/opt/cross_env/rk3588s/install/lib/pkgconfig -DCMAKE_BUILD_TYPE=Debug ..
cmake -DBSP_PKG_CONFIG_PATH=/opt/cross_env/rk3588s/install/lib/pkgconfig -DCMAKE_BUILD_TYPE=Release ..

# for rpi

cmake -DBSP_PKG_CONFIG_PATH=/opt/cross_env/rpi/install/lib/pkgconfig -DCMAKE_BUILD_TYPE=Debug ..
cmake -DBSP_PKG_CONFIG_PATH=/opt/cross_env/rpi/install/lib/pkgconfig -DCMAKE_BUILD_TYPE=Release ..