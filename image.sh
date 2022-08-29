#!/bin/bash

rm /home/httpwned/Downloads/xkcd/*.png
rm /home/httpwned/Downloads/xkcd/*.jpg
nom=$((RANDOM % 2662))

wget https://xkcd.com/$nom -O file.html -P /home/httpwned/Downloads/xkcd/

sleep 1

url=$(grep 'id="comic"' file.html -A1 | grep "img" | sed -e 's/.*src="\/\///' |sed 's/".*//')

wget https://$url -P /home/httpwned/Downloads/xkcd/
feh --bg-max /home/httpwned/Downloads/xkcd/*.png
rm /home/httpwned/Downloads/xkcd/file.html
