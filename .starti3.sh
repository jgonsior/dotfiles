#!/bin/bash
cat $HOME/.config/i3/config.base \
    $HOME/.config/i3/config.local > $HOME/.config/i3/config
exec i3 -V >>  /tmp/i3log-$(date +'%F-%k-%M-%S') 2>&1
