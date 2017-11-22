#!/bin/bash

# fetch weather info from wttr.in and write it in a file
curl -s 'http://wttr.in/berlin' -o ~/.cache/weather

# when done save it to var
WEATHER=$(head -n3 ~/.cache/weather | tail -n1 | cut -d 'm' -f3 | tr -d ' ' | tr '[:upper:]' '[:lower:]')
echo $WEATHER

# convert my svg to an png silently
#inkscape -z -e ~/.cache/weather.png -w 512 -h 512 ~/.conky/weather/icons/$WEATHER.svg > /dev/null

#when done invert its colors
#convert -negate ~/.cache/weather.png ~/.cache/weather.png
