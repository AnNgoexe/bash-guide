#!/bin/bash

# This script collects user information and displays it nicely
echo "Welcome to the User Information Collector"

echo "Step 1: Collecting data..."
echo "Step 2: Formatting..."

read -p "Enter your first name: " first
read -p "Enter your last name: " last

read -p "Enter your age: " age
read -s -p "Enter your password: " password
echo

echo "Processing..."; sleep 1

printf "\n===== User Profile =====\n"
printf "Full Name : %s %s \n" "$first" "$last"
printf "Age:      : %d \n" "$age"
printf "Password  : %s\n" "[hidden]"

echo "Your data has been recorded."
