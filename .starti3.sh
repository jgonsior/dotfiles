#!/bin/bash
export DESKTOP_SESSION=gnome
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
dbus-update-activation-environment --systemd DISPLAY
$HOME/.startLocalStuff.sh&
# (sleep 1 && feh --bg-fill $HOME/pictures/wallpaper/wallpaper.jpg)&
setxkbmap -layout de,de -variant neo,basic -option -option grp:sclk_toggle -option grp_led:scroll&
xset -b&
redshift-gtk&
nm-applet --sm-disable&
cat $HOME/.config/i3/config.local $HOME/.config/i3/config.base > $HOME/.config/i3/config
#exec dbus-launch --autolaunch=$(cat /var/lib/dbus/machine-id) i3 -V
exec i3 -V
