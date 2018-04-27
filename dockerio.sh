#!/bin/bash

# DaoCloud 加速器

# [Linux]
# 该脚本可以将 --registry-mirror 加入到你的 Docker 配置文件 /etc/docker/daemon.json 中。
# 适用于 Ubuntu14.04、Debian、CentOS6 、CentOS7、Fedora、Arch Linux、openSUSE Leap 42.1
curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://3fbce964.m.daocloud.io