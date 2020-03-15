export LANG="en_US.UTF-8"
source $HOME/.antigen.zsh
antigen use oh-my-zsh

antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle python
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle colorize


autoload -Uz vcs_info


POWERLEVEL9K_COLOR_SCHEME='dark'
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_MODE="nerdfont-complete"

# Prompt settings
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460 "

# Separators
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''

# Dirs
POWERLEVEL9K_DIR_HOME_BACKGROUND='clear'
POWERLEVEL9K_DIR_HOME_FOREGROUND='blue'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='clear'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='blue'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='clear'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='blue'
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="clear"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"


# VCS icons
POWERLEVEL9K_VCS_GIT_ICON=$'\uf1d3'
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uf113'
POWERLEVEL9K_VCS_STAGED_ICON=$'\uf055'
POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\uf071'
POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\uf00d'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$'\uf0ab '
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$'\uf0aa '
#
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='clear'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='clear'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='clear'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'

# VCS CONFIG
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_VIRTUALENV_BACKGROUND="clear"
POWERLEVEL9K_VIRTUALENV_FOREGROUND="magenta"


# Status
POWERLEVEL9K_OK_ICON=$'\uf164'
POWERLEVEL9K_FAIL_ICON=$'\uf165'
POWERLEVEL9K_CARRIAGE_RETURN_ICON=$'\uf165'
POWERLEVEL9K_STATUS_OK_BACKGROUND="clear"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="clear"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"

POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="clear"
POWERLEVEL9K_CONTEXT_DEFAULT_foreground="grey"

# Time
POWERLEVEL9K_TIME_FORMAT="%F{cyan}\uf017 %D{%I:%M}%f"
POWERLEVEL9K_TIME_BACKGROUND='clear'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='clear'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='magenta'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0.1


POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir dir_writable_joined)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time vcs virtualenv context background_jobs time)

export DEFAULT_USER="$USER"

antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply

#export ZSH=$HOME/.oh-my-zsh

PATH="$HOME/.local/bin:$PATH"
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"


COMPLETION_WAITING_DOTS="true"
plugins=(git colored-man-pages colorize mvn python virtualenvwrapper)

export EDITOR='nvim'
export GOPATH=$HOME/.go
PATH=$PATH:$GOPATH/bin
PATH=$PATH:$HOME/.cargo/bin
NPM_PACKAGES="$HOME/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
PATH="$HOME/.bin/:$PATH"
unset MANPATH  # delete if you already modified MANPATH elsewhere in your configuration
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
#
# fix tmux env renewment
# if [ -n "$TMUX" ]; then
    # function refresh {
        # sshauth=$(tmux show-environment | grep "^SSH_AUTH_SOCK")
        # if [ $sshauth ]; then
            # export $sshauth
        # fi
        # display=$(tmux show-environment | grep "^DISPLAY")
        # if [ $display ]; then
            # export $display
        # fi
    # }
# else
    # function refresh { }
# fi
#
# function preexec {
    # Refresh environment if inside tmux
    # refresh
# }
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'


alias notes="cd ~/documents/n/notes; nvim bullet.md"
alias gs="git status"
alias gc="git commit -m"
alias ga="git add ."
alias gp="git push"

export MATES_DIR=~/.contacts/contacts

export QT_QPA_PLATFORMTHEME="qt5ct"

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

if [[ -v $VIRTUAL_ENV  ]]; then
    echo "hui"
    . "$VIRTUAL_ENV/bin/activate"
elif [ -e "Pipfile" ]; then
    echo "Activated virtualenv"
    # pipenv shell
    . ".venv/bin/activate"
fi


export PIPENV_VENV_IN_PROJECT="1"

