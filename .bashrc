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

# Actually forgot what that is
PS1='[\u@\h \W]\$ '

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# All things that you want to add to the path on login add before this comment!
RVG_PATH=$PATH
RVG_LIBRARY_PATH=$LIBRARY_PATH
RVG_LD_LIBRARY_PATH=$LD_LIBRARY_PATH

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:"/usr/lib/pkgconfig"

# Cuda-Path
# export PATH=$PATH:/opt/cuda/bin

exec fish
