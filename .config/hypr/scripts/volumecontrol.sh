#!/bin/bash

# Define the volume increment (in decimal)
INCREMENT=0.05  # 5% as a decimal
MAX_VOLUME=1.0  # 100% as a decimal
MIN_VOLUME=0.0  # 0% as a decimal

# Function to get the current volume
get_current_volume() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -oP '\d+\.\d+'
}

# Check for flags
while getopts ":id" opt; do
    case $opt in
        i)
            # Increase the volume
            current_volume=$(get_current_volume)
            new_volume=$(echo "$current_volume + $INCREMENT" | bc)
            if (( $(echo "$new_volume <= $MAX_VOLUME" | bc -l) )); then
                wpctl set-volume @DEFAULT_AUDIO_SINK@ "$new_volume"
            else
                echo "Volume cannot exceed ${MAX_VOLUME} (100%)."
            fi
            ;;
        d)
            # Decrease the volume
            current_volume=$(get_current_volume)
            new_volume=$(echo "$current_volume - $INCREMENT" | bc)
            if (( $(echo "$new_volume >= $MIN_VOLUME" | bc -l) )); then
                wpctl set-volume @DEFAULT_AUDIO_SINK@ "$new_volume"
            else
                echo "Volume cannot go below ${MIN_VOLUME} (0%)."
            fi
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

# Check if no flag was provided
if [ $OPTIND -eq 1 ]; then
    echo "Usage: $0 -i | -d"
    exit 1
fi

