#!/bin/bash

# Variables
SERVER_DIR="./server"
JAVA_PROCESS="fabric-server-mc.1.21-loader.0.15.11-launcher.1.0.1.jar"
SCREEN_NAME="minecraft"

# Step: Start the Minecraft server in a new screen session with the provided JVM options
echo "Starting the Minecraft server in a new screen session..."
cd $SERVER_DIR
screen -dmS $SCREEN_NAME java -Xms6G -Xmx6G -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=50 -XX:+AlwaysPreTouch -jar $JAVA_PROCESS nogui

echo "Server started."

