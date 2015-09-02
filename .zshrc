# Path to your oh-my-zsh installation.
export ZSH=/home/mlittrell/.oh-my-zsh
ZSH_THEME="avit"
plugins=(git)
export PATH="/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin:/opt/local/bin:/usr/local/graphviz-2.14/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin:/opt/local/bin:/usr/local/graphviz-2.14/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/mlittrell/.local/bin:/home/mlittrell/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin:/opt/local/bin:/usr/local/graphviz-2.14/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin:/opt/local/bin:/usr/local/graphviz-2.14/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/mlittrell/.local/bin:/home/mlittrell/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin:/opt/local/bin:/usr/local/graphviz-2.14/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin:/opt/local/bin:/usr/local/graphviz-2.14/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/mlittrell/.local/bin:/home/mlittrell/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin:/opt/local/bin:/usr/local/graphviz-2.14/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin:/opt/local/bin:/usr/local/graphviz-2.14/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/mlittrell/.local/bin:/home/mlittrell/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin:/opt/local/bin:/usr/local/graphviz-2.14/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin:/opt/local/bin:/usr/local/graphviz-2.14/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin:/opt/local/bin:/usr/local/graphviz-2.14/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/mlittrell/.local/bin:/home/mlittrell/bin"
source $ZSH/oh-my-zsh.sh

# {{{ Environment
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=1000000
export SAVEHIST=1000000
export LESSHISTFILE="-"
export PAGER="less"
export READNULLCMD="${PAGER}"
export BROWSER="chrome"
export XTERM="urxvtc"
export VIRTUAL_ENV_DISABLE_PROMPT=1
export LD_LIBRARY_PATH=/usr/local/lib:/opt/local/lib
export C_INCLUDE_PATH=/usr/local/include:/opt/local/include
export LIBRARY_PATH=/opt/local/lib

# }}}

# {{{ Manual pages
#     - colorize, since man-db fails to do so
export LESS_TERMCAP_mb=$'\E[01;31m'   # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'   # begin bold
export LESS_TERMCAP_me=$'\E[0m'       # end mode
export LESS_TERMCAP_se=$'\E[0m'       # end standout-mode
export LESS_TERMCAP_so=$'\E[1;33;40m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'       # end underline
export LESS_TERMCAP_us=$'\E[1;32m'    # begin underline
# }}}

# {{{ Aliases
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias c='clear'
alias ls='pwd;ls -la --color'
alias rm='rm -rf'
alias grep='grep --color=always'
alias cleanswa='find . -name "*.sw*" -type f -delete'

alias go-emt='cd ~/repos/monitor'
alias go-dashboard='cd ~/repos/monitor/src/documentroot/dashboard3'

alias docker-api='sudo docker exec -ti api.lan bash'
alias docker-monitor='sudo docker exec -ti monitor bash'
alias docker-logs='sudo docker exec -ti syslogweb bash'
# }}}

# {{{ Completion
compctl -k "(add delete draft edit list import preview publish update)" nb
# }}}

# {{{ ZSH settings
setopt nohup
setopt autocd
setopt cdablevars
setopt nobgnice
setopt noclobber
setopt shwordsplit
setopt interactivecomments
setopt autopushd pushdminus pushdsilent pushdtohome
setopt histreduceblanks histignorespace inc_append_history
setopt nobeep

# keybindings
bindkey -e # emacs
bindkey "\e[A" up-line-or-search
bindkey "\e[B" down-line-or-search
zle -N backward-kill-partial-word
bindkey '^x/' backward-kill-partial-word

# Prompt requirements
setopt extended_glob prompt_subst
autoload colors zsh/terminfo

# New style completion system
autoload -U compinit; compinit
#  * List of completers to use
zstyle ":completion:*" completer _complete _match _approximate
#  * Allow approximate
zstyle ":completion:*:match:*" original only
zstyle ":completion:*:approximate:*" max-errors 1 numeric
#  * Selection prompt as menu
zstyle ":completion:*" menu select=1
#  * Menu selection for PID completion
zstyle ":completion:*:*:kill:*" menu yes select
zstyle ":completion:*:kill:*" force-list always
zstyle ":completion:*:processes" command "ps -au$USER"
zstyle ":completion:*:*:kill:*:processes" list-colors "=(#b) #([0-9]#)*=0=01;32"
#  * Don't select parent dir on cd
zstyle ":completion:*:cd:*" ignore-parents parent pwd
#  * Complete with colors
zstyle ":completion:*" list-colors ""
# Ignore user home direcotry completion
zstyle ':completion:*:*:*:users' ignored-patterns '*'

cdpath=(. ~)  # Set this to (.) if you only want directory completion from the path.

# vcs_info
autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr '%F{28}●'
zstyle ':vcs_info:*' unstagedstr '%F{11}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:[svn]' format '[%c %b%u]'
zstyle ':vcs_info:*' enable bzr git svn

# }}}

function backward-kill-partial-word {
    local WORDCHARS="${WORDCHARS//[\/.]/}"
    zle backward-kill-word "$@"
}

function chpwd() {
    emulate -LR zsh
    ls -la
}
