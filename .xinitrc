#!/bin/bash

if ! [ "$(find /sys/class/power_supply | grep -c "BAT.*")" -eq 0 ]; then
    cbatticon &
fi

dispscript
flameshot &
nm-applet &
pasystray &
blueman-applet &
xcompmgr &
dunst &

session=${1:-dwm}

case $session in
dwm) exec dwm ;;
*) exec $1 ;;
esac
