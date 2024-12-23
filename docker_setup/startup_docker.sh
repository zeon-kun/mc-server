#!/bin/bash

# EULA check -- update on dockerfile env if needed
if [ "$EULA" != "true" ]; then
  echo "You must accept the EULA by setting the EULA environment variable to true."
  exit 1
fi

echo "eula=$EULA" > eula.txt

# Variables

# Step: Start the Minecraft server in a new screen session with the provided JVM options
echo "Starting the Minecraft server in a docker environment..."

exec java $JAVA_OPTS -jar fabric_server.jar --nogui