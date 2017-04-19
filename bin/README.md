# Sound and Brightness

### Setting the right default sound card

The X240 has two sound cards, as you can see when looking at the output of:

```
  lspci -nn | grep -i audio  
  # 00:03.0 Audio device [0403]: Intel Corporation Haswell-ULT HD Audio Controller [8086:0a0c] (rev 0b)
  # 00:1b.0 Audio device [0403]: Intel Corporation 8 Series HD Audio Controller [8086:9c20] (rev 04)
```

As for me, the default sound card I needed to set was the second one.

To do this, create a file named /etc/modprobe.d/alsa-base.conf:

```
  # PCH
  options snd-hda-intel index=0 model=auto vid=8086 pid=9c20  
  # HDMI
  options snd-hda-intel index=1 model=auto vid=8086 pid=0a0c  
```

The vid and pid numbers refers to the 8086:0a0c and 8086:9c20 pairs. Those are identifiers.

### Volume and brightness keys

Install:
```
  xbps-install -S xorg-backlight alsa-utils xbindkeys
```

Copy `sound.sh` and `brightness.sh` to `~/bin/`. Copy `.xbindkeysrc` to `/home/`.