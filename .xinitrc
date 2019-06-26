xrandr --auto --dpi 96
xrandr --output eDP-1-1 --mode 1920x1080 --primary
xrandr --output DP-1-1 --auto --above eDP-1-1

xset r rate 200 25
exec i3
