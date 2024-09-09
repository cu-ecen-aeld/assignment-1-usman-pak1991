#!/bin/bash

# Function to print error messages and exit with a return code
error_exit() {
    echo "$1"
    exit 1
}

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    error_exit "Usage: $0 <filesdir> <searchstr>"
fi

# Assign arguments to variables
filesdir="$1"
searchstr="$2"

# Check if filesdir is a directory
if [ ! -d "$filesdir" ]; then
    error_exit "Error: '$filesdir' is not a directory."
fi

# Count the number of files and matching lines
file_count=$(find "$filesdir" -type f | wc -l)
line_count=$(grep -r -l "$searchstr" "$filesdir" | xargs -I {} grep -c "$searchstr" {} | awk '{s+=$1} END {print s}')

# Print the results
echo "The number of files are $file_count and the number of matching lines are $line_count"
