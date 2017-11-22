#!/bin/sh

# Usage for a 720p, 10fps gif:
# gifenc input.mov output.gif 720 10

# for images only use ffmpeg -i %03d.png output.gif
# or convert -delay 10 -loop 0 *.png animation.gif

palette="/tmp/palette.png"
filters="fps=$4,scale=$3:-1:flags=lanczos"

ffmpeg -v warning -i $1 -vf "$filters,palettegen" -y $palette
ffmpeg -v warning -i $1 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2
