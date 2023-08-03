#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/shapes"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -q main -c "$DIR"/config.ini & disown

external_monitor=$(xrandr --query | grep 'HDMI-A-0')
if [[ $external_monitor = *connected* ]]; then
	polybar -q external_monitor -c "$DIR"/config.ini & disown 
fi
