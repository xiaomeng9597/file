#!/bin/bash

# 工作目录
sudo mkdir -p /mnt/xiaomeng9597/files
sudo chown "$USER:$GROUPS" /mnt/xiaomeng9597/files
cd /mnt/xiaomeng9597/files

mfile=$(wget -qO- "https://raw.githubusercontent.com/linkease/nas-packages/master/network/services/linkease/Makefile")

version=$(echo "$mfile" | sed -n 's/.*PKG_VERSION:=\([0-9.]*\).*/\1/p')
if [ -z "$version" ]; then
    version=$(echo "$mfile" | grep -oP 'PKG_VERSION:=\s*\K[0-9.]+')
fi

source_url=$(echo "$mfile" | sed -n 's/.*PKG_SOURCE_URL:=\([^[:space:]]*\).*/\1/p')
if [ -z "$source_url" ]; then
    source_url=$(echo "$mfile" | grep -oP 'PKG_SOURCE_URL:=\s*\K[^[:space:]]+')
fi

if [ -n "$version" ] && [ -n "$source_url" ]; then
    wget --connect-timeout=1800 --read-timeout=1800 "$source_url/linkease-binary-$version.tar.gz" -O "linkease-binary-$version.tar.gz"
fi
ls
