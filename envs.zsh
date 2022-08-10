
#     +-------------------------------+
#     | System environment variables. |
#     +-------------------------------+
#             \   ^__^
#              \  (oo)\_______
#                 (__)\       )\/\
#                     ||----w |
#                     ||     ||

export BREWENV="/opt/homebrew"
if [[ ${PATH} != *"${BREWENV}"* ]]; then
        export PATH="${PATH}:${BREWENV}/bin"
fi

export GOPATH="${HOME}/go"

if [[ ${PATH} != *"${GOPATH}"* ]]; then
        export PATH="${PATH}:${GOPATH}/bin"
fi

export PYENV="$ins{HOME}/.pyenv"

if [[ ${PATH} != *"${PYENV}"* ]]; then
        export PATH="${HOME}/.pyenv/shims:${PATH}:${PYENV}/bin"
        eval "$(pyenv init -)"
        # eval "${pyenv virtualenv-init -}"
fi


export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border --layout=reverse --inline-info"

# XHS Exception
export GIT_TERMINAL_PROMPT=1

# Java version 1.11 at least
export CLASSPATH=".:/usr/local/lib/antlr-4.10.1-complete.jar:${CLASSPATH}"

