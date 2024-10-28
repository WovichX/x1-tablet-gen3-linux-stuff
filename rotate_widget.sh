#!/bin/bash

# File to store the enabled state
STATE_FILE="/tmp/rotation_enabled"

# Function to toggle rotation state
toggle_rotation() {
    if [ -f "$STATE_FILE" ]; then
        current_state=$(cat "$STATE_FILE")
        if [ "$current_state" == "enabled" ]; then
            echo "disabled" > "$STATE_FILE"
            notify-send --app-name "Rotation Control" "Rotation disabled"
        else
            echo "enabled" > "$STATE_FILE"
            notify-send --app-name "Rotation Control" "Rotation enabled"
        fi
    else
        # If the file doesn't exist, create it and enable rotation
        echo "enabled" > "$STATE_FILE"
        notify-send --app-name  "Rotation Control" "Rotation enabled"
    fi
}

# Call the toggle function
toggle_rotation
