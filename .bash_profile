#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:~/.scripts

export EDITOR="vim"
export TERMINAL="urxvt"
export BROWSER="firefox"
export GOPATH="$HOME/Software/go"

export XDG_CONFIG_COME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share


if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi

