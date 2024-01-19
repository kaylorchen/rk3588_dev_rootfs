#!/bin/bash
sudo cp -v config.sh rootfs/root/
echo 'bash /root/config.sh' | bash ch-mount.sh -m rootfs
sudo rm -v rootfs/root/config.sh
