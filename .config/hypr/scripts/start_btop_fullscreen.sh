#!/bin/bash
if pgrep -x "btop" > /dev/null; then
	echo "btop is already running"
	exit 0
fi

kitty -e btop &
sleep 0.1
hyprctl dispatch fullscreenstate 1 last
hyprctl dispatch movetoworkspace 10
