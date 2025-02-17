#For printing commands not for executing
#!/bin/bash
# Check if at least two arguments are passed (delay and one command)
if [ $# -lt 2 ]; then
echo "Usage: $0 delay 'command1'
.........

command2'
.........

sleep $delay
done

exit 1
fi

# Get the delay from the first argument
delay=$1

# Shift to the remaining commands (move past the delay argument)
shift

# Loop through the remaining commands and just print each one
for command in "$@"
do

echo "Command to execute: $command" # Print the command
echo "Waiting for $delay seconds ... " # Print the delay message
# Wait for the specified delay
