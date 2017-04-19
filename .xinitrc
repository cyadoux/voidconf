#!/bin/sh
# ~/.xinitrc

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi &

xbindkeys &

setxkbmap us -v workman -option caps:escape &

# DWM status-bar
while true
do
	DATE=$(date +%Y-%m-%d)
	TIME=$(date +%H:%M)
	
	xsetroot -name "$DATE $TIME"
	sleep 20s
done &

exec dwm