#!/bin/bash

# Check if a terminal emulator name is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <terminal_emulator>"
    exit 1
fi

# Store the terminal emulator name in a variable
TERMINAL_EMULATOR=$1

# Try to open ranger in the specified terminal emulator
$TERMINAL_EMULATOR -e ranger &
sleep 0.1
hyprctl dispatch movetoworkspace 9

# Check if the previous command was successful
if [ $? -ne 0 ]; then
    echo "Failed to open ranger with $TERMINAL_EMULATOR. Please check if the terminal emulator is installed and supports the '-e' option."
    exit 2
fi
