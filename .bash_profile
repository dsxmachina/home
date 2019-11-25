#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:~/.scripts

#export EDITOR="emacsclient -a vim -nw -s $HOME/.emacs.d/server/instance1"
export EDITOR="vim"
export TERMINAL="urxvt"
export BROWSER="firefox"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi
