#!/bin/bash
# grim  ~/.config/background.png
# magick ~/.config/background.png -resize 20%  ~/.config/background
cp ~/Pictures/Background/bg-image.png ~/.config/background
hyprlock &
rm ~/.config/background.png
