#!/bin/bash

DOMAIN="docker.jitsi.com"
JICOFO_AUTH_PASSWORD="jicofo123"

# 容器初次运行时安装deb包
if [ -d "/build" ]; then

    echo "jitsi-meet-web-config jitsi-videobridge/jvb-hostname string $DOMAIN" | debconf-set-selections
    echo "jicofo jicofo/jicofo-authpassword string $JICOFO_AUTH_PASSWORD" | debconf-set-selections

    dpkg -i /build/jicofo_1.0-0-g9fc93ed-1_all.deb
    
    # 赋予jicofo.sh可执行权限
    chmod u+x /usr/share/jicofo/jicofo.sh

    rm -rf /build/

fi

# 重启服务
service jicofo restart

# Docker容器后台运行,就必须有一个前台进程
dummy=/config/dummy
if [ ! -f "$dummy" ]; then
	touch $dummy
fi
tail -f $dummy