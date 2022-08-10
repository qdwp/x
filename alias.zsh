
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
alias d="date +\"%F %T\""
alias say="cowsay"
alias e="exit"
alias vi="vim"
alias vim="nvim"
alias o="open ."
alias ss="open -a Sublime\ Text"
alias ctags="/opt/homebrew/bin/ctags"

ra() {
    if [ -z "$RANGER_LEVEL" ]; then
        ranger "$@"
    else
        exit
    fi
}

cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# ANTLR4(Java 1.11 at least)
#
# OS X
# $ cd /usr/local/lib
# $ sudo curl -O https://www.antlr.org/download/antlr-4.10.1-complete.jar
# $ export CLASSPATH=".:/usr/local/lib/antlr-4.10.1-complete.jar:$CLASSPATH"
alias antlr4='java -jar /usr/local/lib/antlr-4.10.1-complete.jar'
alias grun='java org.antlr.v4.gui.TestRig'
