#!/bin/bash
$HOME/.screenlayout/standard.sh&
feh --bg-fill $HOME/pictures/wallpaper/wallpaper.jpg&
#wicd-client --tray&
firefox-nightly&
setxkbmap -layout de,de -variant neo,basic -option -option grp:sclk_toggle -option grp_led:scroll&
xset -b&
redshift-gtk&
qtpass&
nm-applet --sm-disable&
#(sleep 25 && syncthing-gtk) &
(sleep 25 && telegram-desktop) &
#(sleep 25 && gajim) &
(gpgconf --kill gpg-agent && gpg-connect-agent updatestartuptty /bye)&
xmodmap -e "keycode 133=ISO_Level3_Shift"&
cat $HOME/.config/i3/config.local $HOME/.config/i3/config.base > $HOME/.config/i3/config
exec i3 -V >>  /tmp/i3log-$(date +'%F-%k-%M-%S') 2>&1
