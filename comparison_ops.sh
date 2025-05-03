#!/bin/bash

# Define numeric variables
a=5
b=7

# Compare using numeric operators
if [[ $a -lt $b ]]; then
  echo "$a is less than $b"
fi

if [[ $a -eq $b ]]; then
  echo "$a is equal to $b"
else
  echo "$a is not equal to $b"
fi

if [[ $a -ge $b ]]; then
  echo "$a is greater than or equal to $b"
else
  echo "$a is less than $b"
fi
