#!/bin/bash

icon_enabled=""
icon_disabled=""
bt_service=$(systemctl is-active bluetooth.service)
bt_blocked=$(rfkill list bluetooth | cut -d ':' -f 2 | head -n 2 | tail -n 1)

if [ $bt_service == "active" ]; then
    if [ $bt_blocked == "no" ]; then
        echo "$icon_enabled"
    fi
    #echo "$icon_disabled"
#else
    #echo "$icon_disabled"
fi
