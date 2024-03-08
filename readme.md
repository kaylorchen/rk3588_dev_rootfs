# A Cross-Compilation Environment Based on the Ubuntu 22.04 ARM64-bit System

> Because the author needs to compile related feature packages for the rk3588, there will be some software packages related to the rk3588 in the root filesystem; however, this does not affect any other functionality.

## Install the cross-compilation toolchain
```bash
sudo apt update
sudo apt install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu
```

## Build a cross-compilation environment rootfs

```bash
git clone https://github.com/kaylorchen/rk3588_dev_rootfs.git
cd rk3588_dev_rootfs
bash ./build-rootfs.sh
```

## Compile your code using the cross-compilation environment
Following the steps above, a file named "toolchain-aarch64.cmake" will be generated in the current directory. You will need to use it in your CMake project.
For example:
```bash
mkdir build
cmake -DCMAKE_TOOLCHAIN_FILE=/opt/data/orangepi/rk3588_dev_rootfs/toolchain-aarch64.cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
make 
```
> /opt/data/orangepi/rk3588_dev_rootfs/toolchain-aarch64.cmake is an absolute path


## Update your rootfs
When we compile code, sometimes we find that some dependency packages are missing. We need to update our rootfs.  
1. edit ***_config.sh_***, add a new package named "aaa":
```bash
#!/bin/bash
apt update
apt install -y --no-install-recommends vim libopencv-dev g++ gcc \
fakeroot devscripts libspdlog-dev libsystemd-dev libcap-dev liblz4-dev \
libgcrypt-dev libzstd-dev debhelper rknpu2-dev librockchip-mpp-dev librga-dev \
libstb-dev libturbojpeg0-dev libjpeg-turbo8-dev kaylordut-dev aaa
```
2. update rootfs
```bash
./update.sh
```


