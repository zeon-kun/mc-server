#!/bin/bash

# Variables
SCREEN_NAME="minecraft"
BACKUP_SCRIPT="/home/minecraft/backup.sh"

# Function to check if the screen session is running
is_screen_active() {
    screen -list | grep -q "\.$SCREEN_NAME"
}

# Main loop
while true; do
    if ! is_screen_active; then
        echo "$(date): Screen session $SCREEN_NAME is not active. Running backup script."
        $BACKUP_SCRIPT
    else
        echo "$(date): Screen session $SCREEN_NAME is active. No action needed."
    fi
    # Sleep for a certain interval before checking again (e.g., 5 minutes)
    sleep 300
done

