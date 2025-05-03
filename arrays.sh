#!/bin/bash

# =================================
# 🍇 Bash Array Demo
# =================================

# 🥝 1. Array Declaration
fruits=("apple" "banana" "cherry")
echo "Initial fruits: ${fruits[@]}"

# 🍍 2. Access Array Elements
echo "First fruit: ${fruits[0]}"
echo "Second fruit: ${fruits[1]}"

# 🍊 3. Add Elements to the Array
fruits+=("orange", "banana")
echo "After adding fruits: ${fruits[@]}"

# 🥭 4. Remove an Element
unset fruits[1]  # remove 'banana'
echo "After removing second fruit (banana): ${fruits[@]}"

# 🍓 5. Iterate Over the Array
echo "Iterating over fruits:"
for fruit in "${fruits[@]}"; do
   echo fruit
done

# 🍏 6. Get Array Length
echo "Total number of fruits: ${#fruits[@]}"


# =================================
# 🌈 Associative Array Demo
# =================================

# 📝 1. Declare Associative Array
declare -A colors
colors[orange]="yellow"
colors[apple]="red"
colors[grape]="purple"

# 🗑️ 2. Remove an Element
unset colors[banana]

# 🔍 3. Access by Key
echo
echo "Color of apple: ${colors[apple]}"
echo "Color of grape: ${colors[grape]}"
echo "Trying to access removed key (banana): ${colors[banana]}"

# 🧾 4. Iterate Over Keys & Values
echo "All fruit colors:"
for key in "${!colors[@]}"; do
  echo "  - $key is ${colors[$key]}"
done
