#!/usr/bin/zsh

# Options
FG=`xrq foreground`
BG=`xrq background`
WIDTH="60"
HEIGHT="25"
FONT="artwiz lime-8"

# Get monitor width so we can center the bar.
#MONITOR_WIDTH=`xrandr --current | awk '/current/ {print $8;}'`
MONITOR_WIDTH=`dattr w eDP1`
GEOMETRY="${WIDTH}x${HEIGHT}+$((MONITOR_WIDTH - WIDTH))+25"

battery() {
    BATPERC=$(acpi --battery | cut -d, -f2)
    echo -ne "" "$BATPERC"
}

while true; do
    echo -e "%{c}%{F$FG}%{B$BG} $(battery) %{F-}%{B-}"
    sleep 0.1
done | lemonbar -g $GEOMETRY -f "$FONT" -f "FontAwesome-8" -B $BG -d

