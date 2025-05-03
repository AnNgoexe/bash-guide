# ==============================
# 🔑 Demo: Variables in Bash
# ==============================

# 🧾 Declare a simple variable (global)
user_name=""

read -p "Enter your name: " user_name
read -p "Enter your age: " age

greeting="Welcome"
echo "$greeting, $user_name! You are $age years old."

echo "Your PATH environment varible is: $PATH"
echo "Your user name in system:"
echo $USER

global_msg="I am global"

function show_local_var() {
    local local_msg="I am local"
    echo "Inside function:"
    echo "Local: $local_msg"
    echo "Global: $global_msg"
}

echo
echo "Running function show_local_var..."
show_local_var

echo  "Trying to access local_msg outside function"
echo "$local_msg" # should be empty

make_env_var() {
   export exported_var="I am exported"
}

make_env_var
echo "Exported var outside function: $exported_var"
