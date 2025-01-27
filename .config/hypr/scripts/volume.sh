#!/bin/bash

case $1 in 
  increase)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
    ;;
  decrease)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
    ;;
  mute)
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    ;;
  *)
    echo "Usage: $0 {increase|decrease|mute}"
    exit 1
    ;;
esac

percentage=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{if ($3 == "[MUTED]") print "Muted"; else print $2 * 100}')
if [[ "$percentage" == "Muted" ]]; then
  dunstify -a "percentage" -u normal "Audio Status" "Muted"
else  
  dunstify -a "percentage" -h string:x-dunst-stack-tag:brightness -h int:value:"$percentage" "$percentage% Volume"
fi
