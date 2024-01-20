# 指定交叉编译器的位置
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

# 设置CMAKE_MAKE_PROGRAM
# set(CMAKE_MAKE_PROGRAM /usr/bin/make)
# 指定编译器（你需要替换为你自己交叉编译工具的实际路径）
set(CMAKE_C_COMPILER /usr/bin/aarch64-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER /usr/bin/aarch64-linux-gnu-g++)

set(CMAKE_SYSROOT /opt/data/orangepi/rk3588_dev_rootfs/rootfs)

# 指定目标环境的根目录（sysroot）
set(CMAKE_FIND_ROOT_PATH /opt/data/orangepi/rk3588_dev_rootfs/rootfs)

# 设置是否使用目标环境中的程序
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# 设置在查找库时是否只查找目标环境中的库
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)

# 设置在查找头文件时是否只查找目标环境中的头文件
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# 通知CMake要使用自定义的pkg-config文件
set(ENV{PKG_CONFIG_DIR} "${CMAKE_SYSROOT}/usr/lib/pkgconfig")
set(ENV{PKG_CONFIG_LIBDIR} "${CMAKE_SYSROOT}/usr/lib/pkgconfig:${CMAKE_SYSROOT}/usr/share/pkgconfig")
set(ENV{PKG_CONFIG_SYSROOT_DIR} ${CMAKE_SYSROOT})

# set(CMAKE_STAGING_PREFIX ${CMAKE_SYSROOT}/usr)
# # 当进行交叉编译时，指定头文件的搜索路径
# include_directories(${CMAKE_STAGING_PREFIX}/include)

# # 添加需要链接的库文件目录
# link_directories(${CMAKE_STAGING_PREFIX}/lib/aarch64-linux-gnu)

# get_directory_property(dir_link_dirs DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} LINK_DIRECTORIES)
# foreach(dir ${dir_link_dirs})
#   message(STATUS "全局链接目录：${dir}")
# endforeach()