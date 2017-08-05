PATH="$HOME/.local/bin:$PATH"
#export TERM="xterm-256color"
export ZSH=/home/monkey/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_COLOR_SCHEME='light'
COMPLETION_WAITING_DOTS="true"
plugins=(git colored-man-pages colorize mvn python )
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR='nvim'
export GOPATH=$HOME/.go
PATH=$PATH:$GOPATH/bin

# fix tmux env renewment
if [ -n "$TMUX" ]; then
    function refresh {
        sshauth=$(tmux show-environment | grep "^SSH_AUTH_SOCK")
        if [ $sshauth ]; then
            export $sshauth
        fi
        display=$(tmux show-environment | grep "^DISPLAY")
        if [ $display ]; then
            export $display
        fi
    }
else
    function refresh { }
fi

function preexec {
    # Refresh environment if inside tmux
    refresh
}
