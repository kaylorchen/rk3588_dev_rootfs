# 初次编译生成rootfs
编译使用
```
./build-rootfs.sh
```
# 更新rootfs
我们可以通过修改config.sh文件中的apt安装软件包，添加你需要的安装包
更新使用
```
./update.sh
```

# 编译C++工程

```bash
mkdir build
cmake -DCMAKE_TOOLCHAIN_FILE=/opt/kaylor/data/work/rockchip/rk3588_dev_rootfs/toolchain-aarch64.cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
make 
```


