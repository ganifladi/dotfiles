#!/bin/bash

icon=""

if [[ $1 -eq 1 ]]; then
    rofi -show drun -theme-str '#prompt { text-color: rgba(0,0,0,0%); }'
fi

echo $icon
