#!/bin/bash

# Configuration
STEP="4"    # Anything you like.
UNIT="dB"   # dB, %, etc.

# Set volume
SETVOL="/usr/bin/amixer -qc 0 set Master"

case "$1" in
    "up")
          $SETVOL $STEP$UNIT+
          ;;
  "down")
          $SETVOL $STEP$UNIT-
          ;;
  "mute")
          $SETVOL toggle
          ;;
esac

exit 0