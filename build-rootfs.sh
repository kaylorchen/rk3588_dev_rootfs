#!/bin/bash
mkdir -pv rootfs
sudo tar -xvpzf ubuntu-base-22.04.3-base-arm64.tar.gz -C rootfs
sudo cp -v /etc/resolv.conf rootfs/etc/
sudo sed -i "s/ports.ubuntu.com/mirrors.huaweicloud.com/g" rootfs/etc/apt/sources.list
sudo tee rootfs/etc/apt/sources.list.d/rk3588-kaylor.list << EOF
deb [signed-by=/etc/apt/keyrings/kaylor-keyring.gpg] http://apt.kaylordut.cn/rk3588/ubuntu jammy main
deb [signed-by=/etc/apt/keyrings/kaylor-keyring.gpg] http://apt.kaylordut.cn/kaylordut/ kaylordut main
EOF
sudo cp -v kaylor-keyring.gpg rootfs/etc/apt/keyrings/
sudo apt update
sudo apt install -y gcc-aarch64-linux-gnu g++-aarch64-linux-gnu
sudo bash update.sh
