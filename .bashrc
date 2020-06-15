#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
if [[ -z "$PS1" ]]; then return; fi
if [[ -n $IN_NIX_SHELL ]]; then return; fi
if [ -e /home/machina/.nix-profile/etc/profile.d/nix.sh ]; then 
	. ~/.nix-profile/etc/profile.d/nix.sh
fi # added by Nix installer

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
export LD_LIBRARY_PATH=$(nixGLNvidia printenv LD_LIBRARY_PATH):$LD_LIBRARY_PATH

# Cuda-Path
# export PATH=$PATH:/opt/cuda/bin

#[[ "$(tty)" = "/dev/tty1" ]] || exec fish
export PATH=/bin/lscript:/bin/lscript:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/cuda-10.0/bin:/opt/cuda/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/machina/.scripts:$PATH
