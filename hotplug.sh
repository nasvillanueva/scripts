#!/bin/sh
. /home/jvillanueva/.zshenv
export DISPLAY=:0
export XAUTHORITY=/home/jvillanueva/.Xauthority

sleep 10
if [[ -n "$(xrandr | grep "HDMI1 disconnected")" ]]; then
    xrandr --output eDP1 --auto --output HDMI1 --off
else
    xrandr --output eDP1 --auto --output HDMI1 --right-of eDP1 --auto
fi

sh /home/jvillanueva/.bin/wall-e &

if [[ -n "$(pgrep bspwm)" ]]; then
    sh /home/jvillanueva/.bin/bspwm_workspaces &
fi
