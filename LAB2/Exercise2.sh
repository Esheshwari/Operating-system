#!/bin/bash
# Start a background task (using sleep to simulate a long-running task)
echo "Starting a background task..."
sleep 300 & # Run for 5 minutes in the background
task_pid=$! # Capture the PID of the background task
echo "Background task started with PID: $task_pid"
# Display the jobs running in the background
echo -e "\nListing jobs:"
jobs
# Check if the process is running using ps
echo -e "\nChecking if the task is running..."
ps -p $task_pid
# Prompt the user to pause the task manually
echo -e "\nYou can now manually pause the background task using 'kill -STOP $task_pid'"
echo -e "After pausing, run 'ps -o pid,stat,cmd -p $task_pid' to check the task status."
echo -e "Press Enter to continue once you've paused the task."
read -p "Press Enter to continue..."

# Pausing the background task (User will do this manually)
# (Optional) Uncomment the next line if you want to pause automatically after waiting.
# kill -STOP $task_pid

# Verifying if the task is paused
echo -e "\nChecking task status after pausing (should be stopped):"
ps -o pid,stat,cmd -p $task_pid # Shows the PID, status (should be T), and command

# Prompt the user to resume the task manually
echo -e "\nYou can now manually resume the background task using 'kill -CONT $task_pid'"
echo -e "After resuming, run 'ps -o pid,stat,cmd -p $task_pid' to check the task status."
echo -e "Press Enter to continue once you've resumed the task."
read -p "Press Enter to continue..."

# Resuming the background task (User will do this manually)
# (Optional) Uncomment the next line if you want to resume automatically after waiting.
# kill -CONT $task_pid

# Verifying if the task is resumed
echo -e "\nChecking task status after resuming (should be running):"
ps -o pid,stat,cmd -p $task_pid # Shows the PID, status (should be R), and command

# Killing the background task
echo -e "\nKilling the background task..."
kill $task_pid
# Confirming the task has been terminated
echo -e "\nChecking task status after termination (should not exist):"
ps -p $task_pid && echo "Process still exists." || echo "Process terminated."
#The "T" status indicates that the process is stopped, typically by a signal such as SIGSTOP or SIGTSTP. It is not running but still exists in the system's process table.
#T means the process is stopped (paused).
#R means the process is running (actively executing).
