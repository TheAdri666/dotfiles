#!/bin/bash

# Extract the "text" field from the JSON output
text=$(echo "$(waybar-updates)" | jq -r '.text')

# Check if "text" is empty and return the appropriate output
if [ -z "$text" ]; then
    echo '{"text":"0","alt":"updated","tooltip":"System is up to date","class":"updated"}'
else
    echo "$output"
fi
