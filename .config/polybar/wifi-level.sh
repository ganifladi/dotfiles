#!/bin/bash

icon_none=""
icon_weak=""
icon_ok=""
icon_good=""
icon_excellent=""

LEVEL=$(nmcli device wifi | grep -e '^\*' | awk '{getline; print}' | awk '{print $9}')

BLOCKED=$(rfkill list wifi | grep "Soft" | cut -d " " -f 3)

if [ $BLOCKED == "no" ]; then
    if [ -z "$LEVEL" ]; then
        echo "$icon_none"
    elif [ $LEVEL -lt 30 ]; then
        echo "$icon_weak  $LEVEL"
    elif [ $LEVEL -lt 70 ]; then
        echo "$icon_ok  $LEVEL"
    elif [ $LEVEL -gt 69 ]; then
        echo "$icon_good  $LEVEL"
    elif [ $LEVEL -gt 89 ]; then
        echo "$icon_excellent  $LEVEL"
    fi
else
    echo "$icon_none"
fi
