#!/bin/sh
width=$(hyprctl monitors | sed -n '2 p'| sed 's/@.*//' | sed 's/[x]/ /g' | awk '{print $1}')
height=$(hyprctl monitors | sed -n '2 p'| sed 's/@.*//' | sed 's/[x]/ /g' | awk '{print $2}')
# wlogout menu width/4 ~= 213px, height/4 ~= 120px
w=$((width/2 - 213))
h=$((height/2 - 120))
wlogout --protocol layer-shell -b 1 -T $h -B $(($h * 2)) -L $w -R $w

