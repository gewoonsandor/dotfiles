#!/bin/bash
pkill -x waybar
source $HOME/.config/waybar/waybar-mediaplayer/waybar/bin/activate
waybar -c $HOME/.config/waybar/config.jsonc -s $HOME/.config/waybar/style.css &
waybar -c $HOME/.config/waybar/config_bot.jsonc -s $HOME/.config/waybar/style.css &
