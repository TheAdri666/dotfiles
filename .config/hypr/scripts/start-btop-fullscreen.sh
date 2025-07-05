#!/bin/bash
if pgrep -x "btop" > /dev/null; then
	echo "btop is already running"
	exit 0
fi

kitty --class btop -e btop &

