#!/bin/bash

set -e

sudo pacman -S gvim
cp ./vimrc ~/.vim/vimrc

sudo pacman -S chromium the_silver_searcher nodejs npm
sudo npm -g install instant-markdown-d

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# in vim, run :PlugInstall

# copy CocConfig file
cp coc-settings.json ~/.vim/coc-settings.json

echo '
# enable control-s and control-q
stty start undef
stty stop undef
setopt noflowcontrol
' >> ~/.zshrc

echo '
# enable control-s and control-q
stty -ixon
' >> ~/.bashrc

echo '
# Reset ctrl + s AND ctrl + q
nnoremap <c-s> :w<CR> # normal mode: save
inoremap <c-s> <Esc>:w<CR>l # insert mode: escape to normal and save
vnoremap <c-s> <Esc>:w<CR> # visual mode: escape to normal and save
' >> ~/.vim/vimrc

# install tmux
sudo pacman -S tmux
cp ~/repos/x/tmux.conf ~/.tmux.conf
