#!/bin/bash
mkdir -pv rootfs
sudo tar -xvpzf ubuntu-base-22.04.3-base-arm64.tar.gz -C rootfs
sudo cp -v /etc/resolv.conf rootfs/etc/
sudo sed -i "s/ports.ubuntu.com/mirrors.huaweicloud.com/g" rootfs/etc/apt/sources.list
sudo apt update
sudo apt install -y gcc-aarch64-linux-gnu g++-aarch64-linux-gnu
sudo bash update.sh
