#!/bin/bash

# Target files and directory
file="$HOME/bash-guide/comparison_ops.sh"
another_file="$HOME/bash-guide/another_ops.sh"
directory="$HOME/bash-guide"

echo "🔍 Testing file: $file"
echo "🔍 Against file: $another_file"
echo "🔍 In directory: $directory"
echo

# Check if the file exists
if [ -e "$file" ]; then
  echo "✅ File '$file' exists."
else
  echo "❌ File '$file' does not exist."
fi

# Check if it's a regular file
if [ -f "$file" ]; then
  echo "✅ '$file' is a regular file."
else
  echo "❌ '$file' is not a regular file."
fi

# Check if it's a directory
if [ -d "$directory" ]; then
  echo "✅ '$directory' is a directory."
else
  echo "❌ '$directory' is not a directory."
fi

# Check if the file is readable
if [ -r "$file" ]; then
  echo "✅ File '$file' is readable."
else
  echo "❌ File '$file' is not readable."
fi

# Check if the file is writable
if [ -w "$file" ]; then
  echo "✅ File '$file' is writable."
else
  echo "❌ File '$file' is not writable."
fi

# Check if the file is executable
if [ -x "$file" ]; then
  echo "✅ File '$file' is executable."
else
  echo "❌ File '$file' is not executable."
fi

# Check if the file is not empty
if [ -s "$file" ]; then
  echo "✅ File '$file' is not empty."
else
  echo "❌ File '$file' is empty."
fi

# Compare two files based on modification time
if [ -e "$file" ] && [ -e "$another_file" ]; then
  if [ "$file" -nt "$another_file" ]; then
    echo "🆕 '$file' is newer than '$another_file'."
  elif [ "$file" -ot "$another_file" ]; then
    echo "📁 '$file' is older than '$another_file'."
  else
    echo "⚖️ '$file' and '$another_file' have the same modification time."
  fi
else
  echo "⚠️ One of the files doesn't exist for comparison."
fi
