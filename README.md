Submission Reminder App

 Overview

The Submission Reminder App is a Bash script that helps track students' assignment submissions. It allows users to create an environment where students' submission records are stored and dynamically updated without overwriting existing data

 Features

Automatically creates a directory structure for managing submissions.

Stores and updates a submissions.txt file with new student records.

Reads and displays students who have not yet submitted their assignments.

Uses environment configurations to track assignment deadlines.

 Project Structure

submission_reminder_<username>/
├── app/
│   ├── reminder.sh  # Main script to check submissions
├── modules/
│   ├── functions.sh  # Functions for handling submissions
├── assets/
│   ├── submissions.txt  # Student submissions database
├── config/
│   ├── config.env  # Configuration file for assignment tracking
├── startup.sh  # Script to start the application
└── create_environment.sh  # Script to set up the environment

 Setup & Installation

Clone this repository:

git clone https://github.com/IgihozoColombe/submission_reminder_app_IgihozoColombe.git

Navigate into the project directory:

cd submission_reminder_app_IgihozoColombe

Run the setup script and enter your name when prompted:

./create_environment.sh

Navigate to the created environment folder:

cd submission_reminder_<your_name>

Start the application:

./startup.sh

 How It Works

The setup script (create_environment.sh) creates a new directory structure based on the user’s name.

It initializes the submissions.txt file with existing student records.

When new students are added, their records are appended to submissions.txt instead of overwriting.

The reminder script (reminder.sh) checks for students who have not submitted their assignments.

Running startup.sh displays all submissions and highlights pending ones.
