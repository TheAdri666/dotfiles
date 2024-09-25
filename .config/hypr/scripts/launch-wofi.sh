#!/bin/bash

# Check if wofi is already running
if pgrep -x "wofi" > /dev/null
then
    echo "Wofi is already running."
else
    # Launch wofi
    wofi "$@"
fi
