#!/bin/bash

route=/home/httpwned/Downloads/xkcd
rm $route/*.png
rm $route/*.jpg
rm $route/*.gif
nom=$((RANDOM % 2662))

wget https://xkcd.com/$nom -O $route/file.html

sleep 1

url=$(grep 'id="comic"' $route/file.html -A1 | grep "img" | sed -e 's/.*src="\/\///' |sed 's/".*//')

wget https://$url -P $route/

img=$route/*.*g
echo $img
convert $img -channel RGB -negate $img

feh --bg-max $img
rm $route/file.html



