#!/bin/bash

# Prompt for user name
read -p "Enter your name: " user_name

# Define the main directory
main_dir="submission_reminder_${user_name}"

# Create directory structure
mkdir -p "$main_dir/app"
mkdir -p "$main_dir/modules"
mkdir -p "$main_dir/assets"
mkdir -p "$main_dir/config"

# Create necessary files if they do not exist
touch "$main_dir/app/reminder.sh"
touch "$main_dir/modules/functions.sh"
touch "$main_dir/assets/submissions.txt"
touch "$main_dir/config/config.env"
touch "$main_dir/startup.sh"

# Ensure submissions.txt has a header if empty
if [ ! -s "$main_dir/assets/submissions.txt" ]; then
    echo "student,assignment,submission status" > "$main_dir/assets/submissions.txt"
    echo "Chinemerem,Shell Navigation,not submitted" >> "$main_dir/assets/submissions.txt"
    echo "Chiagoziem,Git,submitted" >> "$main_dir/assets/submissions.txt"
    echo "Divine,Shell Navigation,not submitted" >> "$main_dir/assets/submissions.txt"
    echo "Anissa,Shell Basics,submitted" >> "$main_dir/assets/submissions.txt"
fi

# Ask the user for new student details
echo "Enter new student details:"
read -p "Student Name: " student_name
read -p "Assignment Name: " assignment_name
read -p "Submission Status (submitted/not submitted): " submission_status

# Format the new student record correctly
new_student="$student_name,$assignment_name,$submission_status"

# Check if the student already exists
if ! grep -Fxq "$new_student" "$main_dir/assets/submissions.txt"; then
    echo "$new_student" >> "$main_dir/assets/submissions.txt"
    echo "✅ New student added successfully!"
else
    echo "⚠️ Student already exists in the record!"
fi

# Populate reminder.sh file
cat > "$main_dir/app/reminder.sh" << 'EOF'
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
EOF

chmod +x "$main_dir/app/reminder.sh"

# Populate functions.sh
cat > "$main_dir/modules/functions.sh" << 'EOF'
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
EOF
chmod +x "$main_dir/modules/functions.sh"

# Ensure config.env file exists
if [ ! -s "$main_dir/config/config.env" ]; then
cat > "$main_dir/config/config.env" << 'EOF'
# Configuration file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF
fi

# Ensure startup.sh exists and runs the reminder app
cat > "$main_dir/startup.sh" << 'EOF'
#!/bin/bash

echo "Starting the submission reminder app..."
bash ./app/reminder.sh
EOF
chmod +x "$main_dir/startup.sh"

echo "✅ Environment setup complete in $main_dir."
