# 8. Basic Shell Programming
The first line that you will write in bash script files is called `shebang`. This line in any script determines the script's ability to be executed like a standalone executable without typing sh, bash, python, php etc beforehand in the terminal.
```bash
#!/bin/bash
```

## 8.0 🛠️ How to Create and Run a Bash Script
**1. Navigate to your working directory**

Use `cd` to move into the directory where you want to create your script:
```bash
cd path/to/your/directory
```

**2. Create a new script file**

Create a script file using `touch`
```bash
touch my_script.sh
```

**3. Edit the file and add Bash content**

Open the file in a text editor (like nano):

```bash
nano my_script.sh
```


Paste this content:
```bash
#!/bin/bash

# A simple script that prints a message
echo "✅ Hello from your first Bash script!"
```

**4. Make the script executable**

```bash
chmod +x my_script.sh
```

**5. Run the script**

Now run the script directly:
```bash
./my_script.sh
```

Or run it using the Bash interpreter:
```bash
bash my_script.sh
```


## 8.1 📝 Bash Syntax for Scripting
Bash scripts are sequences of commands executed by the Bash shell. They automate tasks and can be used to perform complex operations. Understanding Bash syntax is crucial for writing effective scripts.
### 🧾 Comments
Comments start with a `#` and Bash ignores them. They explain what your code does, making it easier to understand.
```bash
# This script prints a greeting message
echo "Hello, World!"
```

### 🔁 Command Execution Order
Commands are run (or executed) in sequence from top to bottom. This order affects the logic and functionality of the script.
```bash
echo "First command"
echo "Second command"
```

### ➕ Semicolons
Semicolons `;` can be used to separate multiple commands on the same line, which is useful for writing concise scripts.
```bash
echo "This is a test"; echo "This is another test"
```

### 📤 Output with `echo` and `printf`
The `echo` command is the most common way to display output in Bash. It writes text to the terminal.
```bash
echo "Hello, world!"
```

`printf` offers more control over formatting, similar to C-style output.
```bash
printf "Name: %s\nAge: %d\n" "Alice" 30
```

### 📥 Input with read
The read command allows you to accept user input and store it in variables.
```bash
echo "Enter your name:"
read name
echo $name
```

You can also prompt inline:

```bash
read -p "Enter your age: " age
echo "You are $age years old."
```

To hide sensitive input (like passwords), use the `-s` flag:

```bash
read -s -p "Enter your password: " password
echo
echo "Password set!"
```

Read multiple variables at once:
```bash
echo "Enter your first and last name:"
read first last
echo "Hello, $first $last!"
```


## 8.2 🔑 Variables in Bash
### Understanding Variables in Bash
Variables in Bash are used to store data that can be used and manipulated throughout your script or command-line session. Bash variables are untyped, meaning they can hold any type of data.

### Declaring Variables

Creating variables in bash is similar to other languages. There are no data types. A variable in bash can contain a number, a character, a string of characters, etc. You have no need to declare a variable, just assigning a value to its reference will create it.

Variables are declared by simply assigning a value to a name. There should be no spaces around the equal sign. To access the value of a variable, prefix it with a dollar sign: `$variable_name`

Example:
```bash
str = "hello"   # ❌ This will cause an error
str= "hello"    # ❌ Still wrong
str="hello"     # ✅ Correct
```

### Environment Variables
Environment variables are special variables that affect the way processes run on your system. They are often used to store system-wide values like the location of executables or the default editor.
```bash
# Display the PATH environment variable
echo "Your PATH is $PATH"
```

### Local vs. Global Variables
- **Local Variables**: These variables are accessible only within the script or function in which they are declared. They cannot be accessed outside of that scope.

Syntax:
```bash
local variable_name=value
```

Example:
```bash
my_function() {
  local var="I am local"
  echo $var
}

my_function  # Output: I am local
echo $var    # ❌ Will give an error because $var is local to the function
```

- **Global Variables**: These variables are accessible throughout the entire script or shell session. They are created by simply declaring them outside any functions, and they can be accessed from anywhere in the script.

To declare a global variable in Bash, you simply assign a value to a variable without using the `local` keyword inside a function, or declare it entirely outside of any function.

Example:
```bash
name="Linux"

say_hello() {
  echo "Hello, $name"
}

say_hello  # Hello, Linux
```

```bash
set_var() {
  greeting="Hi there"
}

set_var
echo $greeting  # Hi there

```

To make a variable global within a function, use the export command. This makes the variable available to child processes as an environment variable.
```bash
my_function() {
  export var="I am now global"
}

my_function
echo $var   # Output: I am now global
```

## 8.3 💡 Data types
### Strings
Strings are sequences of characters used to store text. They can be manipulated using various string operations such as concatenation and substring extraction.

```bash
# String example
greeting='Hello, '
name='Alice'
full_greeting="$greeting $name"
echo $full_greeting
```

### Numbers
Numbers in Bash can be used for arithmetic operations. Bash supports integer arithmetic natively, such as addition, subtraction, multiplication, and division.

```bash
# Number example
num1=5
num2=10
sum=$((num1 + num2))
difference=$((num2 - num1))
product=$((num1 * num2))
quotient=$((num2 / num1))
echo "Sum: $sum, Difference: $difference, Product: $product, Quotient: $quotient"
```

### Arrays
- Arrays are used to store multiple values in a single variable. 
- Each element in an array is accessed using an index. Arrays in bash are zero based
- You can iterate over arrays and modify elements.
- There's no maximum limit on the size of array. The first element is indexed with element 0.

**Array Declaration Syntax**
```bash
array_name=(value1 value2 value3 ...)
```

**Access Array Elements**
```bash
echo ${array_name[index]}
```

**Add Elements to an Array**
```bash
array_name+=(new_value)
```

**Remove an Element**
```bash
unset array_name[index]
```

**Iterate Over an Array**:
```bash
for item in "${array_name[@]}"; do:
   echo item
done
```

**Get Array Length**
```bash
echo ${#array_name[@]}
```

Example:
```bash
# Array declaration
fruits=("apple" "banana" "chery")
echo "Initial array: ${fruits[@]}"

# Access array elements
echo "First fruit: ${fruits[0]}"
echo "Second fruit: ${fruits[1]}"

# Add elements to the array
fruits+=("orange" "grape")
echo "After adding fruits: ${fruits[@]}"

# Remove an element
unset fruits[1]
echo "After removing second fruit: ${fruits[@]}"

# Iterate over the array
for fruit in "${fruits[@]}"; do
  echo fruit
done

# Get array length
echo "Total number of fruits: ${#fruits[@]}"
```

### Associative Arrays
Associative arrays allow you to use named keys to access values. They are similar to dictionaries in other programming languages. You can add or remove keys and values.

Example:
```bash
# Associative array example
declare -A colors

colors[apple]="red"
colors[banana]="yellow"
colors[grape]="purple"

unset colors[banana]
echo ${colors[apple]} # red
echo ${colors[grape]} # purple
```

## 8.4. 🔀 Ternary conditions

Bash has also support for the ternary conditions. Check some examples below.
```bash
${varname:-word}    # if varname exists and isn't null, return its value; otherwise return word
${varname:=word}    # if varname exists and isn't null, return its value; otherwise set it word and then return its value
${varname:+word}    # if varname exists and isn't null, return word; otherwise return null
${varname:offset:length}    # performs substring expansion. It returns the substring of $varname starting at offset and up to length characters
```

Example:
```bash
name="Alice"
echo ${name:-"Guest"}     # Output: Alice

echo ${user:="admin"}     # Output: admin (also sets user=admin)

color="blue"
echo ${color:+yes}        # Output: yes

text="bashscript"
echo ${text:4:6}          # Output: script
```


## 8.5. 🔧 Operators
Bash provides several types of operators for performing arithmetic, comparison, string, and logical operations, ....

### 🧮 Arithmetic Operators
Use `(( ))` to perform integer arithmetic operations:

| Operator |	Description |	Example |
|----------|--------------|---------|
| `+` |	Addition |	`((a + b))` |
| `-` |	Subtraction |	`((a - b))` |
| `*` |	Multiplication |	`((a * b))` |
| `/` |	Division |	`((a / b))` |
| `%` |	Modulus |	`((a % b))` |

Example:
```bash
a=10
b=3
echo $((a + b))  # 13
echo $((a % b))  # 1
```

### 🔤 String Comparison
Used to compare string values:

| Operator |	Meaning |
|----------|----------|
| `=`      |	Equal   |
| `!=`     |	Not equal |
| `-z`	   | Is empty |
| `-n` |	Is not empty |

### 🔍 Comparison Operators
Used to compare numeric values inside `[[ ]]` or `(( ))`:

- **Arithmetic Evaluation** (`(( ))`):
When using `(( ))` for numeric comparisons, Bash treats it as an arithmetic evaluation, so you can use common comparison operators like `<`, `>`, `==`, `!=`, `<=`, `>=` directly without needing to specify a flag like `-lt` or `-gt`. This makes the syntax simpler and more readable.

- **Using `-lt`, `-gt`, etc.**:
These are used when performing tests with `[ ]` (test operator) or `[[ ]]` (extended test operator). They are not arithmetic operations but are used to compare strings or numbers in a more traditional conditional syntax.

| Operator |	Meaning |
|----------|----------|
| `-eq`	| Equal |
| `-ne`	| Not equal |
| `-gt` |	Greater than |
| `-lt`	| Less than |
| `-ge`	| Greater or equal |
| `-le`	| Less or equal |

Example:
```bash
a=5
b=7
if [[ $a -lt $b ]]; then
  echo "$a is less than $b"
fi
```

### ⚙️ Logical Operators
Used for combining conditions:

| Operator |	Meaning |
|----------|----------|
| `&&` |	Logical AND |
| `\|\|`	| Logical OR |
| `!`	| Logical NOT |

Example:
```bash
x=4
y=6
if (( x < 10 && y > 5 )); then
  echo "Condition met"
fi
```

### ✅ File Test Operators  
| **Operator**     |  **Description**          |
| ----------------- | -------------------------- |
| `-e file`         | Checks if the file exists.                                            |
| `-f file`         | Checks if the file is a regular file.                                 |
| `-d file`         | Checks if the file is a directory.                                    |
| `-r file`         | Checks if the file is readable.                                       |
| `-w file`         | Checks if the file is writable.                                       |
| `-x file`         | Checks if the file is executable.                                     |
| `-s file`         | Checks if the file is not empty (i.e., it has a size greater than 0). |
| `file1 -nt file2` | Checks if `file1` is newer than `file2`.                              |
| `file1 -ot file2` | Checks if `file1` is older than `file2`.                              |

Example:
```bash
# File path
file="testfile.txt"
directory="mydirectory"

# Check if the file exists
if [ -e "$file" ]; then
  echo "File '$file' exists."
else
  echo "File '$file' does not exist."
fi

# Check if it's a regular file
if [ -f "$file" ]; then
  echo "'$file' is a regular file."
else
  echo "'$file' is not a regular file."
fi

# Check if it's a directory
if [ -d "$directory" ]; then
  echo "'$directory' is a directory."
else
  echo "'$directory' is not a directory."
fi

# Check if the file is readable
if [ -r "$file" ]; then
  echo "File '$file' is readable."
else
  echo "File '$file' is not readable."
fi

# Check if the file is writable
if [ -w "$file" ]; then
  echo "File '$file' is writable."
else
  echo "File '$file' is not writable."
fi

# Check if the file is executable
if [ -x "$file" ]; then
  echo "File '$file' is executable."
else
  echo "File '$file' is not executable."
fi

# Check if the file is not empty
if [ -s "$file" ]; then
  echo "File '$file' is not empty."
else
  echo "File '$file' is empty."
fi

# Compare two files based on modification time
another_file="anotherfile.txt"
if [ "$file" -nt "$another_file" ]; then
  echo "'$file' is newer than '$another_file'."
else
  echo "'$file' is older than or the same age as '$another_file'."
fi
```

## 8.6. 🔁 Conditionals
The conditional statement in bash is similar to other programming languages. Conditions have many form like the most basic form is `if` expression `then` statement where statement is only executed if expression is true.

```bash
if [ condition ]; then
  # executes if condition is true
elif [ another_condition ]; then
  # executes if another_condition is true
else
  # executes if none of the above conditions are true
fi
```
- Use `[ ... ]` or `[[ ... ]]` for conditions.
- You can also use `(( ... ))` for arithmetic conditions.
- Always separate brackets and expressions with spaces.

Example:
```bash
num=7

if [ $num -gt 10 ]; then
  echo "Greater than 10"
elif [ $num -eq 10 ]; then
  echo "Equal to 10"
else
  echo "Less than 10"
fi
```

Sometime if conditions becoming confusing so you can write the same condition using the `case statements`.
```bash
case expression in
    pattern1 )
        statements ;;
    pattern2 )
        statements ;;
    ...
esac
```

Example:
```bash
fruit="apple"

case $fruit in
  "apple")
    echo "It's an apple" ;;
  "banana")
    echo "It's a banana" ;;
  *)
    echo "Unknown fruit" ;;
esac
```

## 8.7. ⏳ Loops
There are three types of loops in bash. `for`, `while` and `until`.

Different `for` Syntax:
```bash
for name [in list]
do
  statements that can use $name
done

for (( initialisation ; ending condition ; update ))
do
  statements...
done
```

`while` Syntax:
```bash
while condition; do
  statements
done
```

`until` Syntax:
```bash
until condition; do
  statements
done
```

Example:
```bash
for item in apple banana cherry; do
  echo "Fruit: $item"
done

for ((i = 1; i <= 5; i++)); do
  echo "Number: $i"
done

count=1
while [ $count -le 5 ]; do
  echo "Count is $count"
  ((count++))
done

n=1
until [ $n -gt 5 ]; do
  echo "n = $n"
  ((n++))
done

for file in *.sh; do
  echo "Processing file: $file"
done
```

## 8.8. Functions
As in almost any programming language, you can use functions to group pieces of code in a more logical way or practice the divine art of recursion. Declaring a function is just a matter of writing function `my_func { my_code }`. Calling a function is just like calling another program, you just write its name.

```bash
function name() {
  # shell commands
}
```

Example:
```bash
#!/bin/bash
function hello {
  echo world!
}
hello

function say {
  echo $1
}
say "hello world!"

add() {
  local sum=$(($1 + $2))
  echo $sum
}
result=$(add 5 3)
echo "The sum is $result"
```

When you run the above example the `hello` function will output "world!". The above two functions `hello` and `say` are identical. The main difference is function `say`. This function, prints the first argument it receives. Arguments, within functions, are treated in the same manner as arguments given to the script.

## 8.9. Pipes

Multiple commands can be linked together with a pipe, `|`. A `|` will send the standard-output from command A to the standard-input of command B.
Pipes can also be constructed with the `|&` symbols. This will send the standard-output **and** standard-error from command A to the standard-input of command B.