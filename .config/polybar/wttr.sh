#!/bin/bash

# check network connection
if [[ "$(ping -c 1 8.8.8.8 | grep '100% packet loss' )" != "" ]]; then
    # echo "Internet isn't present"
    exit 1
else
    # echo "Internet is present"

    # fetch weather info from wttr.in and write it in a file
    curl -s 'http://wttr.in/berlin' -o ~/.cache/weather

    # when done save it to var
    WEATHER=$(head -n3 ~/.cache/weather | tail -n1 | cut -d 'm' -f3 | tr -d ' ' | tr '[:upper:]' '[:lower:]')

    case $WEATHER in
        partlycloudy)
            ICON=''
            ;;
        *)
            ICON='noicon'
            ;;
    esac
    echo $WEATHER $ICON

fi

# convert my svg to an png silently
#inkscape -z -e ~/.cache/weather.png -w 512 -h 512 ~/.conky/weather/icons/$WEATHER.svg > /dev/null

#when done invert its colors
#convert -negate ~/.cache/weather.png ~/.cache/weather.png
