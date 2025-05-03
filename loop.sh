#!/bin/bash

# A simple Bash script to demonstrate loops: for, while, and until

# 1. FOR loop: Iterate through a list of numbers
echo "=== FOR Loop ==="
echo "Iterating through numbers from 1 to 5"
for i in {1..5}; do
  echo "Number: $i"
done

echo

# 2. FOR loop with arithmetic evaluation: Sum of numbers from 1 to 10
echo "=== FOR loop with arithmetic ==="
sum=0
for (( i=1; i<=10; i++ )); do
  sum=$(( sum + i ))
done
echo "Sum of numbers from 1 to 10 is: $sum"

echo

# 3. WHILE loop: Repeat until a condition is false
echo "=== WHILE Loop ==="
counter=1
while (( counter <= 5 )); do
  echo "Counter: $counter"
  (( counter++ ))
done

echo

# 4. UNTIL loop: Repeat until a condition becomes true
echo "=== UNTIL Loop ==="
counter=1
until (( counter > 5 )); do
  echo "Counter: $counter"
  (( counter++ ))
done

echo

# 5. Nested Loop: Using for inside a while loop
echo "=== Nested Loop ==="
x=1
while (( x <= 3 )); do
  echo "Outer Loop - x: $x"
  for y in {1..2}; do
    echo "  Inner Loop - y: $y"
  done
  (( x++ ))
done

echo

# 6. Break and Continue Example
echo "=== Break and Continue ==="
echo "Using break to exit loop when counter reaches 3"
for i in {1..5}; do
  if (( i == 3 )); then
    echo "Breaking the loop at i=$i"
    break
  fi
  echo "i: $i"
done

echo

echo "Using continue to skip iteration when counter is 3"
for i in {1..5}; do
  if (( i == 3 )); then
    echo "Skipping i=$i"
    continue
  fi
  echo "i: $i"
done
