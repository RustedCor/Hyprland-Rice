#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "Need to use: $0 <directory_svg> <directory_png>"
	exit 1
fi

DIRECTORY_SVG=$1
DIRECTORY_PNG=$2

mkdir -p "$DIRECTORY_PNG"

for svg_file in "$DIRECTORY_SVG"/*.svg; do
	echo "$svg_file"
	filename=$(basename "$svg_file" .svg)
	magick -background none -density 256 "$svg_file" -resize 64x64 -transparent white "$DIRECTORY_PNG/$filename.png"
done

echo "All files converted."
