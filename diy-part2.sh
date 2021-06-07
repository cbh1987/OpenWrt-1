#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改默认IP地址
sed -i 's/192.168.1.1/10.10.10.1/g' package/base-files/files/bin/config_generate

# 修改主机名字，把OpenXrt修改你喜欢的就行（不能纯数字或者使用中文）
sed -i 's/OpenWrt/OpenXrt/g' ./package/base-files/files/bin/config_generate


# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' ./package/lean/default-settings/files/zzz-default-settings


# 使用源码自带ShadowSocksR Plus+出国软件
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default


# 修改banne文件（banner文件在根目录）（不要修改此行代码,怕弄的diy-lede.sh文件全失效,不需要的话前面加#，或者全行代码删除了）
# rm -rf ./package/base-files/files/etc/banner && cd .. && cp -f ./banner openwrt/package/base-files/files/etc/ && cd openwrt


#内核版本是会随着源码更新而改变的，在coolsnowwolf/lede的源码查看最好，以X86机型为例，源码的target/linux/x86文件夹可以看到有几个内核版本，x86文件夹里Makefile可以查看源码正在使用内核版本
#修改版本内核（下面两行代码前面有#为源码默认最新5.4内核,没#为4.19内核,默认修改X86的，其他机型L大源码那里target/linux查看，对应修改下面的路径就好）
#sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=4.19/g' ./target/linux/x86/Makefile  #修改内核版本
#sed -i 's/KERNEL_TESTING_PATCHVER:=5.4/KERNEL_TESTING_PATCHVER:=4.19/g' ./target/linux/x86/Makefile  #修改内核版本
sed -i "s/DISTRIB_DESCRIPTION='OpenWrt /DISTRIB_DESCRIPTION='OpenXrt Compiled by Bryan /g" package/lean/default-settings/files/zzz-default-settings
