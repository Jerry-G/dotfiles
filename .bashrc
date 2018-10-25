#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi
alias ls='ls --color=auto'
alias t='time'
alias grep='grep --color=auto'
alias d='cd ~/Downloads'
alias D='cd ~/Documents'
alias h='cd ~'
alias jc='javac '
alias lsblk='lsblk -o NAME,TYPE,RM,SIZE,FSTYPE,MOUNTPOINT'
cd() { builtin cd "$@" && ls; }
j() { javac "$@.java" && java "$@";}
alias q='exit'
alias r='ranger'
alias s='s'


export HISTCONTROL=ignoreboth:erasedups
export PATH="${PATH}:/home/jg/.scripts/"



#pretty rainbow prompt <3
PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"


[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"

