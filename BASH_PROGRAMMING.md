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

## 💡 8.3. Data types
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

## 8.4. Ternary conditions

Bash has also support for the ternary conditions. Check some examples below.
```bash
${varname:-word}    # if varname exists and isn't null, return its value; otherwise return word
${varname:=word}    # if varname exists and isn't null, return its value; otherwise set it word and then return its value
${varname:+word}    # if varname exists and isn't null, return word; otherwise return null
${varname:offset:length}    # performs substring expansion. It returns the substring of $varname starting at offset and up to length characters
```

Example:
```bash

```

## 8.3 String Substitution

Check some of the syntax on how to manipulate strings

```bash
${variable#pattern}         # if the pattern matches the beginning of the variable's value, delete the shortest part that matches and return the rest
${variable##pattern}        # if the pattern matches the beginning of the variable's value, delete the longest part that matches and return the rest
${variable%pattern}         # if the pattern matches the end of the variable's value, delete the shortest part that matches and return the rest
${variable%%pattern}        # if the pattern matches the end of the variable's value, delete the longest part that matches and return the rest
${variable/pattern/string}  # the longest match to pattern in variable is replaced by string. Only the first match is replaced
${variable//pattern/string} # the longest match to pattern in variable is replaced by string. All matches are replaced
${#varname}     # returns the length of the value of the variable as a character string
```

## 8.4. Other String Tricks

Bash has multiple shorthand tricks for doing various things to strings.

```bash
${variable,,}    #this converts every letter in the variable to lowercase
${variable^^}    #this converts every letter in the variable to uppercase

${variable:2:8}  #this returns a substring of a string, starting at the character at the 2 index(strings start at index 0, so this is the 3rd character),
                 #the substring will be 8 characters long, so this would return a string made of the 3rd to the 11th characters.
```

Here are some handy pattern matching tricks
```bash
if [[ "$variable" == *subString* ]]  #this returns true if the provided substring is in the variable
if [[ "$variable" != *subString* ]]  #this returns true if the provided substring is not in the variable
if [[ "$variable" == subString* ]]   #this returns true if the variable starts with the given subString
if [[ "$variable" == *subString ]]   #this returns true if the variable ends with the given subString
```


The above can be shortened using a case statement and the IN keyword
```bash
case "$var" in
  begin*)
    #variable begins with "begin"
  ;;
  *subString*)
    #subString is in variable
  ;;

  *otherSubString*)
    #otherSubString is in variable
  ;;
esac
```

## 8.5. Functions
As in almost any programming language, you can use functions to group pieces of code in a more logical way or practice the divine art of recursion. Declaring a function is just a matter of writing function my_func { my_code }. Calling a function is just like calling another program, you just write its name.

```bash
function name() {
    shell commands
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
```

When you run the above example the `hello` function will output "world!". The above two functions `hello` and `say` are identical. The main difference is function `say`. This function, prints the first argument it receives. Arguments, within functions, are treated in the same manner as arguments given to the script.

## 8.6. Conditionals

The conditional statement in bash is similar to other programming languages. Conditions have many form like the most basic form is `if` expression `then` statement where statement is only executed if expression is true.

```bash
if [ expression ]; then
    will execute only if expression is true
else
    will execute if expression is false
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

Expression Examples:

```bash
statement1 && statement2  # both statements are true
statement1 || statement2  # at least one of the statements is true

str1=str2       # str1 matches str2
str1!=str2      # str1 does not match str2
str1<str2       # str1 is less than str2
str1>str2       # str1 is greater than str2
-n str1         # str1 is not null (has length greater than 0)
-z str1         # str1 is null (has length 0)

-a file         # file exists
-d file         # file exists and is a directory
-e file         # file exists; same -a
-f file         # file exists and is a regular file (i.e., not a directory or other special type of file)
-r file         # you have read permission
-s file         # file exists and is not empty
-w file         # you have write permission
-x file         # you have execute permission on file, or directory search permission if it is a directory
-N file         # file was modified since it was last read
-O file         # you own file
-G file         # file's group ID matches yours (or one of yours, if you are in multiple groups)

file1 -nt file2     # file1 is newer than file2
file1 -ot file2     # file1 is older than file2

-lt     # less than
-le     # less than or equal
-eq     # equal
-ge     # greater than or equal
-gt     # greater than
-ne     # not equal
```

## 8.7. Loops

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

# 8.8. Regex

They are a powerful tool for manipulating and searching text. Here are some examples of regular expressions that use each `metacharacter`:

<table>
   <tr>
      <td><a href="#a-dot">`.`(dot)</a></td>
      <td><a href="#b-asterisk">`*`(asterisk)</a></td>
      <td><a href="#c-plus">`+`(plus)</a></td>
      <td><a href="#d-question_mark">`?`(question mark)</a></td>
      <td><a href="#c-plus">`|`(pipe)</a></td>
      <td><a href="#c-plus">`[]`(character class)</a></td>
      <td><a href="#c-plus">`[^]`(negated character class)</a></td>
      <td><a href="#c-plus">`()`(grouping)</a></td>
      <td><a href="#c-plus">`{}`(quantifiers)</a></td>
      <td><a href="#c-plus">`\`(escape)</a></td>
   </tr>
</table>

### a. `.` (dot)
Matches any single character except newline.  
```bash
grep h.t file.txt
```
Output:
```bash
hat
hot
hit
```

### b. `*` (asterisk)
Matches zero or more occurrences of the preceding character or group.
```bash
grep ab*c file.txt
```
Output:
```bash
ac
abc
abbc
abbbc
```

### c. `+` (plus)
Matches one or more occurrences of the preceding character or group.
```bash
grep ab+c file.txt
```
Output:
```bash
abc
abbc
abbbc
abbbbc
```

### d. `?` (question mark)
Matches zero or one occurrence of the preceding character or group.
```bash
grep ab?c file.txt
```
Output:
```bash
ac
abc
```

### e. `|` (pipe)
Matches either the pattern to the left or the pattern to the right.
```bash
egrep "cat|dog" file.txt
```
Output:
```bash
cat
dog
```

### f. `[]` (character class)
Matches any character inside the brackets.
```bash
[aeiou] will match any vowel
[a-z] will match any lowercase letter
```

### g. `[]` (negated character class)
Matches any character not inside the brackets.
```bash
[^aeiou] will match any consonant
[^a-z] will match any non-lowercase letter
```

### h. `()` (grouping)
Groups multiple tokens together and creates a capture group.
```bash
egrep "(ab)+" file.txt
```

Output:
```bash
ab
abab
ababab
```

### i. `{}` (quantifiers)
Matches a specific number of occurrences of the preceding character or group.
```bash
egrep "a{3}" file.txt
```

Output:
```bash
aaa
aaaa
aaaaa
```

### j. `\` (escape)
Escapes the next character to match it literally.
```bash
egrep "a\+" file.txt
```

Output:
```bash
a+
```
=======
## 8.9. Pipes

Multiple commands can be linked together with a pipe, `|`. A `|` will send the standard-output from command A to the standard-input of command B.
Pipes can also be constructed with the `|&` symbols. This will send the standard-output **and** standard-error from command A to the standard-input of command B.

# 9. Tricks

## Set an alias

Run `nano ~/.bash_profile` and add the following line:

```bash
alias dockerlogin='ssh www-data@adnan.local -p2222'  # add your alias in .bash_profile
```

## To quickly go to a specific directory

Run `nano ~/.bashrc` and add the following line:

```bash
export hotellogs="/workspace/hotel-api/storage/logs"
```

Now you can use the saved path:

```bash
source ~/.bashrc
cd $hotellogs
```

## Re-execute the previous command

This goes back to the days before you could rely on keyboards to have an "up" arrow key, but can still be useful. 
To run the last command in your history
```bash
!!
```
A common error is to forget to use `sudo` to prefix a command requiring privileged execution. Instead of typing the whole command again, you can:
```bash
sudo !!
```
This would change a `mkdir somedir` into `sudo mkdir somedir`.

## Exit traps

Make your bash scripts more robust by reliably performing cleanup.

```bash
function finish {
  # your cleanup here. e.g. kill any forked processes
  jobs -p | xargs kill
}
trap finish EXIT
```

## Saving your environment variables

When you do `export FOO = BAR`, your variable is only exported in this current shell and all its children, to persist in the future you can simply append in your `~/.bash_profile` file the command to export your variable
```bash
echo export FOO=BAR >> ~/.bash_profile
```

## Accessing your scripts

You can easily access your scripts by creating a bin folder in your home with `mkdir ~/bin`, now all the scripts you put in this folder you can access in any directory.

If you can not access, try append the code below in your `~/.bash_profile` file and after do `source ~/.bash_profile`.
```bash
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
```

# 10. Debugging
You can easily debug the bash script by passing different options to `bash` command. For example `-n` will not run commands and check for syntax errors only. `-v` echo commands before running them. `-x` echo commands after command-line processing.

```bash
bash -n scriptname
bash -v scriptname
bash -x scriptname
```

# 11. Multi-threading
You can easily multi-threading your jobs using `&`. All those jobs will then run in the background simultaneously and you can see the processes below are running using `jobs`.

```bash
sleep 15 & sleep 5 &
```

The optional `wait` command will then wait for all the jobs to finish.

```bash
sleep 10 & sleep 5 &
wait
```

## Contribution

- Report issues [How to](https://help.github.com/articles/creating-an-issue/)
- Open pull request with improvements [How to](https://help.github.com/articles/about-pull-requests/)
- Spread the word

## Translation
- [Chinese | 简体中文](https://github.com/vuuihc/bash-guide)
- [Turkish | Türkçe](https://github.com/omergulen/bash-guide)
- [Japanese | 日本語](https://github.com/itooww/bash-guide)
- [Russian | Русский](https://github.com/navinweb/bash-guide)
- [Vietnamese | Tiếng Việt](https://github.com/nguyenvanhieuvn/hoc-bash)
- [Spanish | Español](https://github.com/mariotristan/bash-guide)

## License

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
