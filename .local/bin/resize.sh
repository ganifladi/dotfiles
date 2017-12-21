#!/bin/bash

VID=0;
PIC=0;
PICSIZE=1920x1080

case $1 in
    video) VID=1;;
    picture) PIC=1;;
esac

if [ "$PIC" -eq 1 ]; then
    for PICTURE in *.jpg; do
        if [[ "$PICTURE" == x-*.jpg ]]; then
            # echo success;
            echo $PICTURE has already been resized;
        else
            # echo fail;
            convert $PICTURE -resize $PICSIZE x-$PICTURE;
        fi
    done

    for PICTURE in *.png; do
        if [[ "$PICTURE" == x-*.png ]]; then
            # echo success;
            echo $PICTURE has already been resized;
        else
            # echo fail;
            convert $PICTURE -resize $PICSIZE x-$PICTURE;
        fi
    done

fi

if [ "$VID" -eq 1 ]; then

    for VIDEO in *.mp4; do
        if [[ "$VIDEO" == x-*.mp4 ]]; then
            # echo success;
            echo $VIDEO has already been resized;
        else
            # echo fail;
            ffmpeg -i $VIDEO -acodec copy -vcodec libx264 -crf 40 "x-${VIDEO}"
        fi
    done

    for VIDEO in *.MOV; do
        if [[ "$VIDEO" == x-*.mp4 ]]; then
            # echo success;
            echo $VIDEO has already been resized;
        else
            # echo fail;
            ffmpeg -i $VIDEO -acodec copy -vcodec libx264 -crf 40 "x-${VIDEO}"
        fi
    done

fi
