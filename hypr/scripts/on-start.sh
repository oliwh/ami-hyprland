#!/bin/sh

swaybg --output '*' --color "#aaaaaa" &
cd ~/.config/waybar/topbar
waybar -c config.jsonc -s style.css &
sleep 0.05
cd ~/.config/waybar/mainbar
waybar -c config.jsonc -s style.css &
cd ~/.config/waybar/bottombar


