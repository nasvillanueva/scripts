#!/usr/bin/zsh

# Options
FG=`xrq foreground`
BG=`xrq background`
WIDTH="130"
HEIGHT="25"
FONT="artwiz lime-8"

# Get monitor width so we can center the bar.
#MONITOR_WIDTH=`xrandr --current | awk '/current/ {print $8;}'`
MONITOR_WIDTH=`dattr w eDP1`
GEOMETRY="${WIDTH}x${HEIGHT}+$((MONITOR_WIDTH - WIDTH))+60"

clock() {
    DATETIME=$(date "+%a %b %d, %I:%M %p")
    echo -n "$DATETIME"
}

while true; do
    echo -e "%{c}%{F$FG}%{B$BG} \uf073 $(clock) %{F-}%{B-}"
    sleep 0.1
done | lemonbar -g $GEOMETRY -f "$FONT" -f "FontAwesome-8" -B $BG -d

