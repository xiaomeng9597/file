#!/bin/bash

# cd /lib/firmware/brcm/

wget -O /lib/firmware/brcm/brcmfmac43430-sdio.bin https://github.com/xiaomeng9597/files/releases/download/wifi/brcmfmac43430-sdio.bin
wget -O /lib/firmware/brcm/brcmfmac43430-sdio.panther,x2.bin https://github.com/xiaomeng9597/files/releases/download/wifi/brcmfmac43430-sdio.bin
wget -O /lib/firmware/brcm/brcmfmac43430-sdio.clm_blob https://github.com/xiaomeng9597/files/releases/download/wifi/brcmfmac43430-sdio.clm_blob
wget -O /lib/firmware/brcm/brcmfmac43430-sdio.panther,x2.clm_blob https://github.com/xiaomeng9597/files/releases/download/wifi/brcmfmac43430-sdio.clm_blob
wget -O /lib/firmware/brcm/brcmfmac43430-sdio.txt https://github.com/xiaomeng9597/files/releases/download/wifi/brcmfmac43430-sdio.txt
wget -O /lib/firmware/brcm/brcmfmac43430-sdio.panther,x2.txt https://github.com/xiaomeng9597/files/releases/download/wifi/brcmfmac43430-sdio.txt

echo "WiFi驱动包已下载到指定目录完毕，正在重启系统中……"

rm -f /root/brcmfmac43430-sdio-panther-x2.sh

reboot