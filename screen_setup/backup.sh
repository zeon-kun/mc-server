#!/bin/bash

# Variables
SERVER_DIR="./server"
BACKUP_DIR="./backup"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="$BACKUP_DIR/server_backup_$TIMESTAMP.tar.gz"
JAVA_PROCESS="fabric-server-mc.1.21-loader.0.15.11-launcher.1.0.1.jar"
SCREEN_NAME="minecraft"

# Step 1: Create a compressed backup
echo "Creating a backup..."
tar -czf $BACKUP_FILE $SERVER_DIR

# Step 2: Delete backups older than 7 days
echo "Deleting old backups..."
find $BACKUP_DIR -type f -name "server_backup_*.tar.gz" -mtime +7 -exec rm {} \;

# Step 3: Check if a screen session with the name exists and kill it
if screen -list | grep -q "\.$SCREEN_NAME"; then
    echo "Killing the existing screen session named $SCREEN_NAME..."
    screen -S $SCREEN_NAME -X quit
    # Wait for a few seconds to ensure the session is terminated
    sleep 5
fi

# Step 4: Start the Minecraft server in a new screen session with the provided JVM options
echo "Starting the Minecraft server in a new screen session..."
cd $SERVER_DIR
screen -dmS $SCREEN_NAME java -Xms6G -Xmx6G -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=50 -XX:+AlwaysPreTouch -jar $JAVA_PROCESS nogui

echo "Script execution completed."

