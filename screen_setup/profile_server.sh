#!/bin/bash

# Path to your Minecraft server
SERVER_DIR="./server"

# Path to save Spark reports
SPARK_REPORT_DIR="./server/reports"

# Start profiling
echo "starting"
screen -S minecraft -p 0 -X stuff "/spark profiler start\n"
sleep 20  # Collect data for 5 minutes

# Stop profiling and save the report
echo "presave"

screen -S minecraft -p 0 -X stuff "/spark profiler stop --file $SPARK_REPORT_DIR/spark_report_$(date +%Y%m%d%H%M%S).txt\n"

echo "success"
