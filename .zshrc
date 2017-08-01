export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM="xterm-256color"
export ZSH=/home/monkey/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_COLOR_SCHEME='light'
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git colored-man-pages colorize mvn python )
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR='nvim'
GOPATH=$HOME/.go
export GOPATH
PATH=$PATH:$GOPATH/bin
