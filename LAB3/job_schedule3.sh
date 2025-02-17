#!/bin/bash
# Basic Shell Script for Job Scheduling (with exactly 4 arguments)

# Usage: ./job_scheduler.sh <delay_in_seconds> "command1" "command2" "command3"

# Check if exactly 4 arguments are provided
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <delay_in_seconds> \"command1\" \"command2\" \"command3\""
    exit 1
fi

# Get the delay from the first argument
delay=$1
shift # Remove the delay argument

# Execute each command with the specified delay
for command in "$@"; do
    echo "Executing: $command"
    eval "$command"  # Execute the command
    echo "Waiting for $delay seconds..."
    sleep "$delay"   # Delay before executing the next command
done

echo "All commands executed."
