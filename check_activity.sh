#!/bin/bash

# Path to Flask log file
LOG_FILE="/var/log/flask_access.log"

# Time threshold (4 hours = 14400 seconds)
THRESHOLD=14400

# Get current time and last request time
CURRENT_TIME=$(date +%s)
LAST_REQUEST=$(stat -c %Y "$LOG_FILE")

# Check inactivity
if (( CURRENT_TIME - LAST_REQUEST > THRESHOLD )); then
    echo "No requests in the last 4 hours. Restarting app..."
    pm2 restart JioSavaanAPI
else
    echo "Requests received within the last 4 hours. No restart needed."
fi