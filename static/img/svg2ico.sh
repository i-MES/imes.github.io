#!/bin/bash

#usage: ./svg2ico.sh logo.svg

set -ex
svg=$1
size=(16 32 24 48 72 96 144 152 192 196)
out=".out"
if [ -d $out ];then
rm -rf $out
fi
mkdir $out

echo Making bitmaps from your svg...
for i in ${size[@]}; do
  inkscape -w $i -o "$out/$i.png" $svg
done

echo Compressing...
## Replace with your favorite (e.g. pngquant、optipng...)
# macOS: brew install pngquant
# optipng -o7 "$out/*.png"
pngquant -f --ext .png $out/*.png --posterize 4 --speed 1

echo Converting to favicon.ico...
convert "$out/*.png" favicon.ico

echo Clean-up
rm -rf "$out/"
echo Done