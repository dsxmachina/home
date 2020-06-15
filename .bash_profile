#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:~/.scripts

#export EDITOR="emacsclient -a vim -nw -s $HOME/.emacs.d/server/instance1"
export EDITOR="vim"
export TERMINAL="urxvt"
export BROWSER="firefox"
# XDG Base Directory Specification
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc
export LESSHISTFILE=$XDG_CACHE_HOME/.lesshst
export HISTFILE=$XDG_CACHE_HOME/.bash_history


if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi
