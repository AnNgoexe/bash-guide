#!/bin/bash

# A simple Bash script to demonstrate conditionals

read -p "Enter your name: " name
read -p "Enter your age: " age

# Validate age is a number
if ! [[ "$age" =~ ^[0-9]+$ ]]; then
  echo "❌ Invalid age input. Please enter a number."
  exit 1
fi

echo
echo "👤 Hello, $name!"

# IF-ELIF-ELSE block to categorize age
if (( age < 13 )); then
  echo "🧒 You are a child."
elif (( age < 18 )); then
  echo "👦 You are a teenager."
elif (( age < 60 )); then
  echo "🧑 You are an adult."
else
  echo "👴 You are a senior citizen."
fi

echo

# CASE example: ask user how they want to proceed
read -p "Would you like to continue (yes/no/maybe)? " response

case "$response" in
  yes|YES|y|Y)
    echo "✅ Proceeding..."
    ;;
  no|NO|n|N)
    echo "❎ Exiting the script. Goodbye!"
    exit 0
    ;;
  maybe|MAYBE)
    echo "🤔 Please come back when you're ready."
    ;;
  *)
    echo "⚠️ Invalid option. Please answer yes/no/maybe."
    ;;
esac
