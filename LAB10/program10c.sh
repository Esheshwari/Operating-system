'''check no. of executable files'''
#!/bin/bash
# Shell Script for Piping Commands
# Usage: ./piping_commands.sh

# Function to display the contents of the current directory
list_directory_contents() {
    echo "Listing contents of the current directory:"
    ls -l
    echo ""
}

# Function to filter and sort directory contents
filter_and_sort_contents() {
    read -p "Enter a pattern to filter files (e.g., .txt for text files): " pattern
    echo "Filtering and sorting files with pattern '$pattern'..."
    ls -l | grep "$pattern" | sort
    echo ""
}

# Function to search for a specific file by name
search_file_by_name() {
    read -p "Enter the file name to search: " filename
    echo "Searching for file '$filename'..."
    find . -type f -name "$filename" 2>/dev/null || echo "File not found."
    echo ""
}

# Function to count total files, directories, and executable files
count_files_and_directories() {
    num_files=$(find . -type f 2>/dev/null | wc -l)          # Count total files
    num_dirs=$(find . -type d 2>/dev/null | wc -l)          # Count total directories
    num_exec_files=$(find . -type f -executable 2>/dev/null | wc -l)  # Count only executable files
    
    echo "Number of files: $num_files"
    echo "Number of directories: $num_dirs"
    echo "Number of executable files: $num_exec_files"
    echo ""
}

# Main menu for user interaction
echo "Piping Commands Manager"
while true; do
    echo "1. List contents of the current directory"
    echo "2. Filter and sort directory contents"
    echo "3. Search for a specific file by name"
    echo "4. Count total files, directories, and executable files"
    echo "5. Exit"
    read -p "Select an option (1-5): " option
    case $option in
        1) list_directory_contents ;;
        2) filter_and_sort_contents ;;
        3) search_file_by_name ;;
        4) count_files_and_directories ;;
        5) echo "Exiting the Piping Commands Manager. Goodbye!"; exit 0 ;;
        *) echo "Invalid option. Please select 1-5." ;;
    esac
    echo "" # Print a newline for better readability
done
