#to schedule shutdown at particular time to run refer understanding.txt
#!/bin/bash

# Target date and time: 24th Feb 2025, 3:45 PM
TARGET="2025-02-24 15:45:00"

# Convert target time to seconds since epoch
TARGET_EPOCH=$(date -d "$TARGET" +%s)

# Get current time in seconds since epoch
CURRENT_EPOCH=$(date +%s)

# Calculate sleep duration
SLEEP_TIME=$((TARGET_EPOCH - CURRENT_EPOCH))

# If sleep time is positive, wait and then shut down
if [ $SLEEP_TIME -gt 0 ]; then
    echo "System will shut down at $TARGET"
    sleep $SLEEP_TIME
    sudo shutdown -h now
else
    echo "The specified time has already passed!"
fi
