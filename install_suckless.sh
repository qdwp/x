#!/bin/bash

set -e

sudo pacman -S imlib2

git clone https://github.com/qdwp/dwm ~/repos/dwm --depth=1
git clone https://github.com/qdwp/st ~/repos/st --depth=1
git clone https://github.com/qdwp/dmenu ~/repos/dmenu --depth=1
git clone https://github.com/qdwp/clock ~/repos/slock --depth=1

cd ~/repos/dwm
make
sudo make install

cd ~/repos/st
make
sudo make install

cd ~/repos/dmenu
make
sudo make install

cd ~/repos/clock
make
sudo make install

echo "
If find: nogroup Err:

    sudo groupadd nogroup
    sudo usermod -a -G nogroup ${USER}

then relogin
"

sed "${LINE}, \$d" ~/.xinitrc > ~/.xinitrc.bak
mv ~/.xinitrc.bak ~/.xinitrc

echo "exec dwm" >> ~/.xinitrc

