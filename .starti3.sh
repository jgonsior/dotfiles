#!/bin/bash
$HOME/.startLocalStuff.sh&
(sleep 1 && feh --bg-fill $HOME/pictures/wallpaper/wallpaper.jpg)&
setxkbmap -layout de,de -variant neo,basic -option -option grp:sclk_toggle -option grp_led:scroll&
xset -b&
redshift-gtk&
qtpass&
nm-applet --sm-disable&
#(sleep 25 && gajim) &
cat $HOME/.config/i3/config.local $HOME/.config/i3/config.base > $HOME/.config/i3/config
exec i3 -V
