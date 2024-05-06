#!/bin/sh

# Terminate all running instances
killall -q polybar

# Wait until the processes are killed
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload top &
	done
else
	polybar --reload example &
fi
