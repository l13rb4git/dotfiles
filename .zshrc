# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM="xterm-256color"

# Path to home
source ~/dotfiles/.zsh_home
# Path to your oh-my-zsh installation.
export ZSH="$NEW_HOME/.oh-my-zsh"

export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# History in cache directory:
HISTSIZE=100
SAVEHIST=100
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# # vi mode
bindkey -v
# export KEYTIMEOUT=1

# Custom cd
chpwd() ls -a

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    if ! type "lf" > /dev/null; then
        wget https://github.com/gokcehan/lf/releases/download/r23/lf-linux-amd64.tar.gz
        tar xvf lf-linux-amd64.tar.gz
        sudo mv lf /usr/local/bin
    fi

    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'


# Make CTRL-Z background things and unbackground them.
function fg-bg() {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
  else
    zle push-input
  fi
}
zle -N fg-bg
bindkey '^Z' fg-bg


# PowerLevel9k configs
# POWERLEVEL9K_COLOR_SCHEME='dark'
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# DEFAULT_USER=`whoami`
# POWERLEVEL9K_VI_COMMAND_MODE_STRING="NORMAL"
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir newline vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status 
#                                     root_indicator 
#                                     background_jobs 
#                                     history 
#                                     time 
#                                     command_execution_time
#                                     vi_mode)

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z web-search vi-mode zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias nv="exec ~/Downloads/nvim/nvim.appimage"
alias v="vim"
alias dotf="cd ~/dotfiles"
alias zcfg="vim ~/dotfiles/.zshrc"
alias rzsh="source ~/dotfiles/.zshrc"
alias vcfg="vim ~/dotfiles/.vimrc"
alias tcfg="vim ~/dotfiles/.tmux.conf"
alias p="python3"
alias t="sudo tmux"
alias c="cd"
alias mkc="take"
alias idea="exec ~/Desktop/idea-IC-192.7142.36/bin/idea.sh"
alias br="br -dp"
alias wp="bash ~/bin/wsl-open"
# Create a python local http server
alias pls="python3 -m http.server -b 192.168.0.106 8000"
# Create and open the python server
alias plso="pls && wp http://192.168.0.106:8000/"

# Virtualenv aliases
alias act="source ./env/bin/activate"
alias dact="deactivate"

# Rails aliases
alias rtemp="vim ~/codes/learn/ruby/temp.rb"
alias r="rails"
alias rs="rails s"
alias rdbc="rails db:create"
alias rdbm="rails db:migrate"
alias cpg="cp Gemfile /mnt/c/Users/fms/Codes/rh-online ; cp Gemfile.lock /mnt/c/Users/fms/Codes/rh-online"
alias chh="sudo chmod 777 "

# Docker aliases
alias dc="sudo docker-compose"
alias dr="sudo docker-compose run web"
alias drr="sudo docker-compose run web bundle exec"
alias ddp="sudo docker-compose run web rm tmp/pids/server.pid"


#source /home/leirbag/.config/broot/launcher/bash/br
export PATH=$PATH:$HOME/anaconda/bin

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/leirbag/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/leirbag/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/leirbag/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/leirbag/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

[[ -e ~/bin ]] && PATH=$PATH:~/bin
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion ] ]

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

DockerResourcesBin="/mnt/c/ProgramData/DockerDesktop/version-bin/"
export PATH=$PATH:$DockerResourcesBin
