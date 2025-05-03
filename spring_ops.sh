#!/bin/bash

# Define string variables
str1="Hello"
str2="World"
str3="Hello"

# Compare strings
if [ "$str1" = "$str3" ]; then
  echo "Strings are equal"
else
  echo "Strings are not equal"
fi

# Check if a string is empty
if [ -z "$str2" ]; then
  echo "String is empty"
else
  echo "String is not empty"
fi

# Check if a string is not empty
if [ -n "$str1" ]; then
  echo "String is not empty"
fi

# Compare strings for inequality
if [ "$str1" != "$str2" ]; then
  echo "Strings are not equal"
fi
