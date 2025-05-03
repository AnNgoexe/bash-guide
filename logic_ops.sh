#!/bin/bash

# Define variables
x=4
y=6

# Combine conditions using logical AND
if (( x < 10 && y > 5 )); then
  echo "Condition met: x is less than 10 AND y is greater than 5"
fi

# Combine conditions using logical OR
if (( x < 3 || y > 5 )); then
  echo "Condition met: x is less than 3 OR y is greater than 5"
fi

# Negate a condition using logical NOT
if ! (( x == 5 )); then
  echo "Condition met: x is NOT equal to 5"
fi
