#!/bin/bash

### 更换Centos默认软件源为国内Yum源

# 1. 备份系统自带源

sudo mkdir /etc/yum.repos.d/CentosRepo.bak
sudo mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/CentosRepo.bak/

# 2. 下载阿里镜像源

# 查看系统的版本
# cat /etc/redhat-release 

#
# [国内的aliyun Yum源] 各系统版本repo文件对应的下载操作
#
# CentOS 5
# wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-5.repo
# CentOS 6
# wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo
# CentOS 7
sudo wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

#
# [国内的163源] 各系统版本repo文件对应的下载操作
#
# CentOS 5
# wget -O /etc/yum.repos.d/CentOS5-Base-163.repo http://mirrors.163.com/.help/CentOS5-Base-163.repo
# CentOS 6
# wget -O /etc/yum.repos.d/CentOS6-Base-163.repo http://mirrors.163.com/.help/CentOS6-Base-163.repo
# CentOS 7
# wget -O /etc/yum.repos.d/CentOS7-Base-163.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo


# 3. 清除缓存
sudo yum clean all

# 4. 把Yum源缓存到本地，加快软件的搜索好安装速度
sudo yum makecache

# 5. 更新系统软件
sudo yum update