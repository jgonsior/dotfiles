export LANG="en_US.UTF-8"
PATH="$HOME/.local/bin:$PATH"
export ZSH=~/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_COLOR_SCHEME='light'
COMPLETION_WAITING_DOTS="true"
plugins=(git colored-man-pages colorize mvn python virtualenvwrapper)
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR='nvim'
export GOPATH=$HOME/.go
PATH=$PATH:$GOPATH/bin
PATH=$PATH:$HOME/.cargo/bin
# npm
NPM_PACKAGES="$HOME/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
PATH="$HOME/.bin/:$PATH"
unset MANPATH  # delete if you already modified MANPATH elsewhere in your configuration
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

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

source $HOME/.gitsoftware/zsh-histdb/sqlite-history.zsh
autoload -Uz add-zsh-hook
add-zsh-hook precmd  histdb-update-outcome

function preexec {
    # Refresh environment if inside tmux
    refresh
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'


alias notes="cd ~/documents/n/notes; nvim bullet.md"


export MATES_DIR=~/.contacts/contacts

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

