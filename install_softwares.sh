#!/bin/bash

sudo pacman -Syyu

sudo pacman -S \
    base-devel \
    gvim \
    git \
    wget \
    curl \
    imlib2 \
    dhcpcd \
    zsh \
    nitrogen \
    picom \
    go \
    pyenv \
    figlet cowsay \
    ttf-dejavu noto-fonts-cjk ttf-nerd-fonts-symbols-mono \
    ranger ueberzug poppler xpdf \


mkdir ~/.dwm
touch ~/.dwm/autostart.sh
chmod a+x ~/.dwm/autostart.sh

git clone https://aur.archlinux.org/yay.git ~/repos/yay --depth=1
cd ~/repos/yay
makepkg -si

# 添加国内源
yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save

sudo groupadd nogroup
sudo usermod -a -G nogroup ${USER}

echo "\n\n\t===> Group Add [nogroup] need relogin ...\n\n"
