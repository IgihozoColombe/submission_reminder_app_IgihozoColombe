#!/bin/bash

# Function to display all submissions
function display_all_submissions {
    local submissions_file=$1
    echo "Displaying all submissions:"
    echo "--------------------------------------------"

    while IFS=, read -r student assignment status; do
        # Ensure it's not the header line
        if [[ "$student" != "student" ]]; then
            echo "$student, $assignment, $status"
        fi
    done < "$submissions_file"
    
    echo "--------------------------------------------"
}
