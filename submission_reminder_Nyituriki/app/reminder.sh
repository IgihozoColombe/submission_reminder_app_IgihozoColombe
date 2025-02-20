#!/bin/bash
source ./config/config.env
source ./modules/functions.sh

submissions_file="./assets/submissions.txt"

echo "--------------------------------------------"
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

# Call function to display all submissions
display_all_submissions "$submissions_file"
