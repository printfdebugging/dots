#!/bin/bash

if ! [ "$(find /sys/class/power_supply | grep -c "BAT.*")" -eq 0 ]; then
    cbatticon &
fi

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

gpg-agent --daemon &
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
