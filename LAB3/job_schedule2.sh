#For Total number of commands
#!/bin/bash
# Check if at least two arguments are passed (delay and one command)
if [ $# -lt 2 ]; then
echo "Usage: $0 delay 'command1'
.........

'command2'
.........

exit 1
fi

# Get the delay from the first argument
delay=$1

# Shift to the remaining commands (move past the delay argument)
shift

# Count the number of commands (arguments)
command_count=$#

echo "Total number of commands: $command_count" # Print the total number of commands

# Loop through the remaining commands and just print each one
for command in "$@"
do
echo "Command to execute: $command"
echo "Waiting for $delay seconds ... " # Print the delay message
sleep $delay
done

# Print the command

# Wait for the specified delay
