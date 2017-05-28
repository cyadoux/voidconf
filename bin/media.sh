#!/bin/bash

# MOC Player commands
PAUSE="/usr/bin/mocp -G"
STOP="/usr/bin/mocp -s"
NEXT="/usr/bin/mocp -f"
PREV="/usr/bin/mocp -r"

case "$1" in
	"pause")
		$PAUSE
		;;
	"stop")
		$STOP
		;;
	"next")
		$NEXT
		;;
	"prev")
		$PREV
		;;
esac

exit 0
