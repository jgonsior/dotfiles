# deactivate shell if Pipfile doesn't exist and not in a subdir
if [[ ! -a "$PWD/Pipfile" ]]; then
    if [[ "$PIPENV_ACTIVE" == 1 ]]; then
        if [[ "$PWD" != "$pipfile_dir"* ]]; then
            echo "exit"
            exit
        fi
    fi
fi

# activate the shell if Pipfile exists
if [[ "$PIPENV_ACTIVE" != 1 ]]; then
  if [[ -a "$PWD/Pipfile" ]]; then
      export pipfile_dir="$PWD"
      source $(pipenv --venv)"/bin/activate"
      # pipenv shell
      # echo $PIPENV_ACTIVE
  fi
fi


# if [[ -v $VIRTUAL_ENV  ]]; then
  # echo "hui"
  # # . "$VIRTUAL_ENV/bin/activate"
# elif [ -e "Pipfile" ]; then
  # echo "Activated virtualenv"
  # pipenv shell
  # # $(pipenv --venv)"/bin/activate"
  # # /home/julius/.local/share/virtualenvs/active-learning-experiments-LFfD1_Ds/bin/activate
# fi


# export PIPENV_VENV_IN_PROJECT="1"




# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LANG="en_US.UTF-8"
source $HOME/.antigen.zsh
antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle python
# antigen bundle pipenv
antigen bundle tmux
# antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle colorize
antigen theme romkatv/powerlevel10k

autoload -Uz vcs_info

export DEFAULT_USER="$USER"

antigen apply

#export ZSH=$HOME/.oh-my-zsh

PATH="$HOME/.local/bin:$PATH"
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"


COMPLETION_WAITING_DOTS="true"
plugins=(tmux git colored-man-pages colorize mvn python virtualenvwrapper)

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

alias ls="exa"
alias cat="bat"
# alias 

export MATES_DIR=~/.contacts/contacts

export QT_QPA_PLATFORMTHEME="qt5ct"

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
