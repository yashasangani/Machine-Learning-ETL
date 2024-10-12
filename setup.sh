#!/bin/bash

# Get git usernames and repository
read -p "Please Enter GitHub username: " username
read -p "Please Enter GitHub Email: " email
read -p "Please Enter GitHub repository link: " url

# Configure git global user.name and user.email
git config --global user.name "$username"
git config --global user.email "$email"

# Clone GitHub repository and create directory
mkdir repository
git clone "$url" "repository"

# Copy requirements.txt to the repository folder
echo "Copying requirements.txt to repository folder"
cp requirements.txt repository

# Change directory to the repository folder
echo "Changing directory to repository folder"
cd repository

# Create a virtual environment called "venv"
echo "Creating a virtual environment"
python3 -m venv venv

# Activate the virtual environment
echo "Activating virtual environment"
source venv/bin/activate

# Upgrade pip
echo "Upgrading pip"
python3 -m pip install --upgrade pip

# Install any required packages using pip
echo "Installing requirements"
pip install -r requirements.txt

# Launch VS Code and ensure that it uses the virtual environment
echo "Opening the repository folder"
code .
