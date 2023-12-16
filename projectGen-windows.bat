@echo off
setlocal EnableDelayedExpansion

REM ANSI escape codes for text colors
set "RED=[0;31m"
set "GREEN=[0;32m"
set "YELLOW=[0;33m"
set "RESET=[0m"  REM Reset text color to default

REM Function to display colored text
:printColor
echo %2%3%1%RESET%
exit /b

REM Clear the terminal
cls

REM Display project header
call :printColor %GREEN% "
#################################
#           PROJECT             #
#          GENERATOR            #  
#             V1.0              #
#################################
"

REM Prompt the user for a folder name
set /p "folder_name=Enter Project Name: "

REM Create the folder
django-admin startproject !folder_name!

REM Check if the folder was created successfully
if !errorlevel! equ 0 (
    call :printColor %GREEN% "Project '!folder_name!' created successfully."
) else (
    call :printColor %RED% "Error creating project '!folder_name'."
    exit /b 1
)

REM Change to the project directory
cd !folder_name!

REM Install Poetry
call :printColor %YELLOW% "Installing Poetry"
echo "-----------------------------"
pip install poetry
echo "-----------------------------"
call :printColor %GREEN% "Installation Complete"

REM Initialize Poetry
call :printColor %YELLOW% "Setting Poetry"
echo "-----------------------------"
poetry init
echo "-----------------------------"
call :printColor %GREEN% "Setting Complete"

REM Install project dependencies
call :printColor %YELLOW% "Installing Dependencies"
echo "-----------------------------"
poetry install
echo "-----------------------------"
call :printColor %GREEN% "Installation Complete"

REM Activate Poetry shell
poetry shell
