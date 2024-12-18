#!/bin/bash

# 工作目录
sudo mkdir -p /mnt/xiaomeng9597/files
sudo chown "$USER:$GROUPS" /mnt/xiaomeng9597/files
cd /mnt/xiaomeng9597/files

# 获取Makefile内容
mfile=$(wget -qO- "https://raw.githubusercontent.com/linkease/nas-packages/master/network/services/linkease/Makefile")

# 提取版本、源URL和哈希值
version=$(echo "$mfile" | sed -n 's/.*PKG_VERSION:=\([0-9.]*\).*/\1/p')
if [ -z "$version" ]; then
    version=$(echo "$mfile" | grep -oP 'PKG_VERSION:=\s*\K[0-9.]+')
fi

source_url=$(echo "$mfile" | sed -n 's/.*PKG_SOURCE_URL:=\([^[:space:]]*\).*/\1/p')
if [ -z "$source_url" ]; then
    source_url=$(echo "$mfile" | grep -oP 'PKG_SOURCE_URL:=\s*\K[^[:space:]]+')
fi

pkg_sha256=$(echo "$mfile" | sed -n 's/.*PKG_HASH:=\([^[:space:]]*\).*/\1/p')
if [ -z "$pkg_sha256" ]; then
    pkg_sha256=$(echo "$mfile" | grep -oP 'PKG_HASH:=\s*\K[^[:space:]]+')
fi

# 下载文件
if [ -n "$version" ] && [ -n "$source_url" ]; then
    wget --connect-timeout=1800 --read-timeout=1800 "$source_url/linkease-binary-$version.tar.gz" -O "linkease-binary-$version.tar.gz"
    # 校验下载的文件的哈希值
    downloaded_sha256=$(sha256sum "linkease-binary-$version.tar.gz" | awk '{print $1}')
    if [ "$downloaded_sha256" != "$pkg_sha256" ]; then
        echo "文件哈希值不匹配，正在删除下载的文件..."
        rm "linkease-binary-$version.tar.gz"
    else
        echo "文件哈希值匹配，下载成功。"
    fi
fi

ls
