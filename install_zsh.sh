#!/bin/bash

set -e

sudo pacman -S zsh
wget -nv -O - https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
cd ~/.zim/modules
git clone https://github.com/zimfw/magicmace --depth=1
echo "zmodule magicmace" >>  ~/.zimrc
zsh ~/.zim/zimfw.zsh install
chsh -s /bin/zsh

echo '
#     +-------------------------------+
#     | System environment variables. |
#     +-------------------------------+
#             \   ^__^
#              \  (oo)\_______
#                 (__)\       )\/\
#                     ||----w |
#                     ||     ||


export GOPATH="${HOME}/go"

if [[ ${PATH} != *"${GOPATH}"* ]]; then
        export PATH="${PATH}:${GOPATH}/bin"
fi

export PYENV="$ins{HOME}/.pyenv"

if [[ ${PATH} != *"${PYENV}"* ]]; then
        export PATH="${PATH}:${PYENV}/bin"
        eval "$(pyenv init -)"
        # eval "${pyenv virtualenv-init -}"
fi

' >> ~/.zim/envs.zsh

echo '
#    +-----------------+
#    |  Command alias. |
#    +-----------------+
#            \   ^__^
#             \  (oo)\_______
#                (__)\       )\/\
#                    ||----w |
#                    ||     ||



alias c="clear"
alias s="neofetch"
alias lg="lazygit"
alias d="date +\"%F %R\""
alias say="cowsay"
alias e="exit"
# alias ra="ranger"

ra() {
    if [ -z "$RANGER_LEVEL" ]; then
        ranger "$@"
    else
        exit
    fi
}

# alias pacmanautoremove="sudo pacman -Rs $(sudo pacman -Qdtq)"
# alias yayautoremove="yay -Rs $(yay -Qdtq)"
' >> ~/.zim/alias.zsh

echo '
# set envs and alias
if [ -e ~/.zim/alias.zsh ]; then
	source ~/.zim/alias.zsh
fi

if [ -e ~/.zim/envs.zsh ]; then
	source ~/.zim/envs.zsh
fi
' >> ~/.zshrc

