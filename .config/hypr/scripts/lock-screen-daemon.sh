#!/bin/bash

if which swayidle &> /dev/null; then
    if which swaylock &> /dev/null; then
        swayidle -w timeout 600 'swaylock' timeout 900 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock' &
    else
	echo "Can't find swaylock. Please install it to use this feature."
    fi
else
    echo "Can't find swayidle. Please install it to use this feature."
fi
