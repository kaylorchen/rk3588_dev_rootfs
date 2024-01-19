#!/bin/bash
mkdir -pv rootfs
sudo tar -xvpzf ubuntu-base-22.04.3-base-arm64.tar.gz -C rootfs
sudo cp -v /etc/resolv.conf rootfs/etc/
sudo sed -i "s/ports.ubuntu.com/mirrors.huaweicloud.com/g" rootfs/etc/apt/sources.list
sudo cp -v config.sh rootfs/root/
echo 'bash /root/config.sh' | bash ch-mount.sh -m rootfs
sudo rm -v rootfs/root/config.sh
