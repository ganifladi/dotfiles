#!/bin/bash

# Script to convert PDF file to JPG images
#
# Dependencies:
# * pdftk
# * imagemagick

PDF=$1

echo "Processing $PDF"
DIR=`basename "$1" .pdf`

mkdir "$DIR"

echo '  Splitting PDF file to pages...'
pdftk "$PDF" burst output "$DIR"/%04d.pdf
pdftk "$PDF" dump_data output "$DIR"/metadata.txt

echo '  Converting pages to JPEG files...'
for i in "$DIR"/*.pdf; do
      convert -colorspace RGB -interlace none -density 300x300 -quality 100 "$i" "$DIR"/`basename "$i" .pdf`.jpg
  done

  echo 'All done'
