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
sudo tee rootfs/etc/apt/sources.list.d/nvidia-l4t-apt-source.list << EOF
deb [signed-by=/usr/share/keyrings/jetson-ota-public.gpg] deb https://repo.download.nvidia.com/jetson/common r36.3 main
deb [signed-by=/usr/share/keyrings/jetson-ota-public.gpg] deb https://repo.download.nvidia.com/jetson/t234 r36.3 main
deb [signed-by=/usr/share/keyrings/jetson-ota-public.gpg] deb https://repo.download.nvidia.com/jetson/ffmpeg r36.3 main
EOF
sudo cp -v jetson-ota-public.gpg /usr/share/keyrings/
sudo apt update
sudo apt install -y gcc-aarch64-linux-gnu g++-aarch64-linux-gnu qemu-user-static
sudo bash update.sh
