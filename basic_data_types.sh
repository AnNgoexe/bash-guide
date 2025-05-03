#!/bin/bash

# ======= STRING EXAMPLE =======
greeting='Hello, '
name='Alice'
full_greeting="$greeting$name"
echo "🔤 String concatenation:"
echo "$full_greeting"
echo ""

# ======= NUMBER EXAMPLE =======
num1=5
num2=10

sum=$((num1 + num2))
difference=$((num2 - num1))
product=$((num1 * num2))
quotient=$((num2 / num1))

echo "🔢 Arithmetic operations:"
echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Quotient: $quotient"
