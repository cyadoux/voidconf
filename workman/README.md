# Workman

### Setup
Install `setxkbmap`:
`$ xbps-install -S setxkbmap`

Create directory for keymap:
`$ mkdir /usr/share/kbd/keymaps/i386/workman`

Copy keymap to directory:
`$ mv workman.map.gz /usr/share/kbd/keymaps/i386/workman/`

Set permissions:
```
$ chmod g=rx workman
$ chmod o=rx workman
```

Set keymap by editing `/etc/rc.conf`:
`KEYMAP=workman`

Logout and login.