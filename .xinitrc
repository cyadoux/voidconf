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

feh --bg-scale ~/pictures/wallpapers/nature/rock_lake.jpg &

# while true
# do
# 	VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
# 	DATE=$(date +%Y-%m-%d)
# 	TIME=$(date +%H:%M)
# 	TZ=$(date +%Z)
# 	IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
# 	TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"

# 	if acpi -a | grep off-line > /dev/null
# 	then
# 		BAT="Bat. $(acpi -b | awk '{ print $4 " " $5 }' | tr -d ',')"
# 		xsetroot -name "$IP $BAT $VOL $TEMP $DATE $TIME $TZ"
# 	else
# 		xsetroot -name "$IP $VOL $TEMP $DATE $TIME $TZ"
# 	fi
# 	sleep 20s
# done &

exec i3
