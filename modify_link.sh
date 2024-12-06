#!/bin/bash
build_make=$(find $1 -name build.make)
link_txt=$(find $1 -name link.txt)
# 打印每一行 build.make 文件内容
if [ -n "$build_make" ]; then
  echo "Contents of build.make files:"
  for file in $build_make; do
    echo "File: $file"
    sed -i 's@ /opt/ros/humble@ /opt/kaylor/data/work/rockchip/rk3588_dev_rootfs/rootfs/opt/ros/humble@g' $file
    sed -i 's@ /usr/lib@ /opt/kaylor/data/work/rockchip/rk3588_dev_rootfs/rootfs/usr/lib@g' $file
  done
else
  echo "No build.make files found."
fi

# 打印每一行 link.txt 文件内容
if [ -n "$link_txt" ]; then
  echo "Contents of link.txt files:"
  for file in $link_txt; do
    echo "File: $file"
    sed -i 's@ /opt/ros/humble@ /opt/kaylor/data/work/rockchip/rk3588_dev_rootfs/rootfs/opt/ros/humble@g' $file
    sed -i 's@ /usr/lib@ /opt/kaylor/data/work/rockchip/rk3588_dev_rootfs/rootfs/usr/lib@g' $file
  done
else
  echo "No link.txt files found."
fi
