#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


function ranger-cd {
    # create a temp file and store the name
    tempfile="$(mktemp -t tmp.XXXXXX)"

    # run ranger and ask it to output the last path into the
    # temp file
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"

    # if the temp file exists read and the content of the temp
    # file was not equal to the current path
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        # change directory to the path in the temp file
        cd -- "$(cat "$tempfile")"
    fi

    # its not super necessary to have this line for deleting
    # the temp file since Linux should handle it on the next
    # boot
    rm -f -- "$tempfile"
}

alias ls='ls --color=auto'
alias ranger='ranger-cd'
alias mpv="mpv --input-ipc-server=/tmp/mpvsoc$(date +%s)"
# Shortcuts:
alias gci="vim ~/.config/i3/config"
alias gcr="vim ~/.config/ranger/rc.conf"
alias pac="sudo pacman"
# NetworkManager.service
alias nmstart="sudo systemctl start NetworkManager.service"
alias nmstop="sudo systemctl stop NetworkManager.service"
# Mutt saves into "Dokumente"
alias neomutt="cd $HOME/Dokumente/;neomutt"
# Actually forgot what that is
PS1='[\u@\h \W]\$ '

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:"/usr/lib/pkgconfig"
