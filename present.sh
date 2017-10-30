#!/bin/sh

if [[ "$1" == "on" ]]; then
    xrandr --output eDP1 --mode 864x486
else
    xrandr --output eDP1 --auto
fi
