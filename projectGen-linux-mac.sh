#!/bin/bash

# ANSI escape codes for text colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RESET='\033[0m'  # Reset text color to default

# Function to display colored text
print_color() {
  local color=$1
  local message=$2
  echo -e "${color}${message}${RESET}"
}

# Clear the terminal
clear

# Display project header
print_color "${GREEN}
#################################
#           PROJECT             #
#          GENERATOR            #  
#             V1.0              #
#################################
" 

# Prompt the user for a folder name
read -p "Enter Project Name: " folder_name

# Create the folder
django-admin startproject "$folder_name"

# Check if the folder was created successfully
if [ $? -eq 0 ]; then
  print_color "${GREEN}" "Project '$folder_name' created successfully."
else
  print_color "${RED}" "Error creating project '$folder_name'."
  exit 1
fi

# Change to the project directory
cd "$folder_name"

# Install Poetry
print_color "${YELLOW}" "Installing Poetry"
echo "-----------------------------"
pip install poetry
echo "-----------------------------"
print_color "${GREEN}" "Installation Complete"

# Initialize Poetry
print_color "${YELLOW}" "Setting Poetry"
echo "-----------------------------"
poetry init
echo "-----------------------------"
print_color "${GREEN}" "Setting Complete"

# Install project dependencies
print_color "${YELLOW}" "Installing Dependencies"
echo "-----------------------------"
poetry install
echo "-----------------------------"
print_color "${GREEN}" "Installation Complete"

# Activate Poetry shell
poetry shell
