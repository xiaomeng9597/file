#!/bin/bash

cd /lib/firmware/brcm/


wget -O /lib/firmware/brcm/brcmfmac43430-sdio.bin https://xiaomeng9597.github.io/files/wifi/brcmfmac43430-sdio.bin
wget -O /lib/firmware/brcm/brcmfmac43430-sdio.panther,x2.bin https://xiaomeng9597.github.io/files/wifi/brcmfmac43430-sdio.bin
wget -O /lib/firmware/brcm/brcmfmac43430-sdio.txt https://xiaomeng9597.github.io/files/wifi/brcmfmac43430-sdio.txt
wget -O /lib/firmware/brcm/brcmfmac43430-sdio.panther,x2.txt https://xiaomeng9597.github.io/files/wifi/brcmfmac43430-sdio.txt


chmod 777 /lib/firmware/brcm/

echo "WiFi驱动包已下载到指定目录完毕正在重启系统中……"

reboot