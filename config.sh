#!/bin/bash
apt update
apt install -y --no-install-recommends vim libopencv-dev g++ gcc \
fakeroot devscripts libspdlog-dev libsystemd-dev libcap-dev liblz4-dev \
libgcrypt-dev libzstd-dev debhelper rknpu2-dev librockchip-mpp-dev librga-dev \
libstb-dev libturbojpeg0-dev libjpeg-turbo8-dev

# 转换绝对路径软链接为相对路径的脚本

TARGET_DIR="/usr/lib" # 指定目标目录

# 使用find命令查找所有的软链接
find "${TARGET_DIR}" -type l | while read -r symlink; do
  # 获取软链接指向的目标
  target=$(readlink "${symlink}")
  # 确定链接是否为绝对路径
  if [[ "${target}" = /* ]]; then
    # 计算相对路径
    relative_target=$(realpath --relative-to="$(dirname "${symlink}")" "${target}")
    # 删除原有软链接
    rm "${symlink}"
    # 创建新的软链接，使用相对路径
    ln -sv "${relative_target}" "${symlink}"
    echo "链接已更新：${symlink} -> ${relative_target}"
  fi
done

echo "所有绝对路径软链接已转换为相对路径。"
