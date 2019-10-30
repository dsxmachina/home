
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
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

alias clear-path='export PATH="${RVG_PATH}";export LIBRARY_PATH="${RVG_LIBRARY_PATH}";export LD_LIBRARY_PATH="${RVG_LD_LIBRARY_PATH}"'

#alias unset-cuda='export PATH="${RVG_PATH}"'
#alias unset-cudas='export PATH="${RVG_PATH}"'

alias set-cuda-10.1='export PATH="${RVG_PATH}:/opt/cuda/bin";export LIBRARY_PATH="${RVG_LIBRARY_PATH}:/opt/cuda/lib64";export LD_LIBRARY_PATH="${RVG_LD_LIBRARY_PATH}:/opt/cuda/lib64"'
alias set-cuda-10.0='export PATH="${RVG_PATH}:/opt/cuda-10.0/bin";export LIBRARY_PATH="${RVG_LIBRARY_PATH}:/opt/cuda-10.0/lib64";export LD_LIBRARY_PATH="${RVG_LD_LIBRARY_PATH}:/opt/cuda-10.0/lib64"'
#alias set-cuda-10.0='export PATH="${RVG_PATH}:/opt/cuda-10.0/bin"'

alias gpu-temp="nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader"
