#!/bin/bash

# Function definition: A simple function to greet a user
greet_user() {
    echo "Hello, $1! Welcome to Bash scripting."
}

# Function with multiple parameters
add_numbers() {
    local sum=$(( $1 + $2 ))  # Local variable to hold the sum
    echo "The sum of $1 and $2 is: $sum"
}

# Function with a return value (exit status)
is_even() {
    if (( $1 % 2 == 0 )); then
        return 0  # Return 0 if the number is even
    else
        return 1  # Return 1 if the number is odd
    fi
}

# Function with a default parameter
greet() {
    local name=${1:-"Guest"}  # If no argument passed, use "Guest" as default
    echo "Hello, $name!"
}

# Function calling and passing arguments
greet_user "Alice"   # Calls the greet_user function with "Alice" as an argument
add_numbers 10 20    # Calls add_numbers function with 10 and 20
greet "John"         # Calls greet function with "John"
greet                # Calls greet function without argument, using default value
is_even 4            # Calls is_even function with argument 4

# Check the return value of is_even
if is_even 4; then
    echo "4 is even."
else
    echo "4 is odd."
fi

# Use a function to simulate a simple calculator
calculator() {
    local num1=$1
    local num2=$2
    local operation=$3

    case $operation in
        add)
            echo "Result: $((num1 + num2))"
            ;;
        subtract)
            echo "Result: $((num1 - num2))"
            ;;
        multiply)
            echo "Result: $((num1 * num2))"
            ;;
        divide)
            if ((num2 != 0)); then
                echo "Result: $((num1 / num2))"
            else
                echo "Error: Division by zero"
            fi
            ;;
        *)
            echo "Invalid operation. Use add, subtract, multiply, or divide."
            ;;
    esac
}

# Using the calculator function
calculator 10 5 add
calculator 10 5 subtract
calculator 10 5 multiply
calculator 10 0 divide
