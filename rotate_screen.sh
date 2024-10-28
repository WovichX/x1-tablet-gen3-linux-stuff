#!/bin/bash

OUTPUT_NAME="eDP-1"
STATE_FILE="/tmp/rotation_enabled"

# Function to get orientation
get_orientation() {
    gdbus call --system --dest net.hadess.SensorProxy --object-path /net/hadess/SensorProxy --method org.freedesktop.DBus.Properties.Get net.hadess.SensorProxy AccelerometerOrientation
}

while true; do
    # Check if the state file exists and read its content
    if [ -f "$STATE_FILE" ]; then
        current_state=$(cat "$STATE_FILE")
    else
        current_state="enabled"  # Default to enabled if the file does not exist
        echo "State file not found. Defaulting to enabled."
        echo "$current_state" > "$STATE_FILE"  # Create the state file with enabled state
    fi

    # Check if rotation is enabled
    if [ "$current_state" == "enabled" ]; then
        ORIENTATION_DATA=$(get_orientation)

        case "$ORIENTATION_DATA" in
            *\<\'normal\'\>*)
                xrandr --output "$OUTPUT_NAME" --rotate normal
                echo "Orientation set to normal"
                ;;
            *\<\'right-up\'\>*)
                xrandr --output "$OUTPUT_NAME" --rotate right
                echo "Orientation set to right-up"
                ;;
            *\<\'left-up\'\>*)
                xrandr --output "$OUTPUT_NAME" --rotate left
                echo "Orientation set to left-up"
                ;;
            *\<\'bottom-up\'\>*)
                xrandr --output "$OUTPUT_NAME" --rotate inverted
                echo "Orientation set to bottom-up"
                ;;
            *)
                echo "Unknown orientation: $ORIENTATION_DATA"
                ;;
        esac
    else
        echo "Rotation is disabled"
    fi

    sleep 1
done
