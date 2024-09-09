#!/bin/bash

# Function to print error messages and exit with a return code
error_exit() {
    echo "$1"
    exit 1
}

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    error_exit "Usage: $0 <writefile> <writestr>"
fi

# Assign arguments to variables
writefile="$1"
writestr="$2"

# Extract the directory path from the full file path
directory=$(dirname "$writefile")

# Create the directory if it doesn't exist
if [ ! -d "$directory" ]; then
    mkdir -p "$directory" || error_exit "Error: Could not create directory '$directory'."
fi

# Write the string to the file, overwriting any existing content
echo "$writestr" > "$writefile" || error_exit "Error: Could not write to file '$writefile'."

# Print success message (optional)
echo "Successfully wrote to $writefile"
