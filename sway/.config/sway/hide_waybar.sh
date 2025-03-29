#!/bin/bash

# Check if Waybar is running
if pgrep -x "waybar"; then
    # Waybar is running, so terminate it
    killall -SIGUSR1 waybar
else
    # Waybar is not running, so start it
    waybar &
fi
