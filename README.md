<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/2059754/24601246/753a7f36-1858-11e7-9d6b-7a0e64fb27f7.png" alt="bash logo"/>
</p>

# Table of Contents
  1. [Basic Operations](#1-basic-operations)  
  2. [File Operations](#2-file-operations)  
  3. [Text Operations](#3-text-operations)  
  4. [Directory Operations](#4-directory-operations)  
  5. [System Info Operations](#5-system-info-operations)  
  6. [Network Operations](#6-network-operations)  
  7. [Process Monitoring Operations](#7-process-monitoring-operations)
  2. [Basic Shell Programming](#2-basic-shell-programming)  
    2.1. [Variables](#21-variables)  
    2.2. [Array](#22-array)  
    2.3. [String Substitution](#23-string-substitution)  
    2.4. [Other String Tricks](#24-other-string-tricks)  
    2.5. [Functions](#25-functions)  
    2.6. [Conditionals](#26-conditionals)  
    2.7. [Loops](#27-loops)  
    2.8. [Regex](#28-regex)  
    2.9. [Pipes](#29-pipes)  
  3. [Tricks](#3-tricks)  
  4. [Debugging](#4-debugging)  
  5. [Multi-threading](#5-multi-threading)

# 1. Basic Operations

### 1.1. `export` - `echo` - `unset` - `env` - `printenv`
The `export` command is used to set environment variables or display all exported variables in the current shell session. 

If you want to get details of a specific variable, you can use `echo $VARIABLE_NAME`. 

To remove a variable, you can use the `unset` command. 

You can also use `env` or `printenv` to display the environment variables in different formats.

```bash
export VARIABLE_NAME=value    # Set a variable and export it
export                        # List all exported environment variables
```

Example:
```bash
anngo@anngo-Vostro-5620:~$ export
declare -x COLORTERM="truecolor"
declare -x DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
declare -x DEBUGINFOD_URLS="https://debuginfod.ubuntu.com "
declare -x DESKTOP_SESSION="ubuntu"
declare -x DISPLAY=":0"
declare -x GDMSESSION="ubuntu"
declare -x GNOME_DESKTOP_SESSION_ID="this-is-deprecated"
declare -x GNOME_KEYRING_CONTROL="/run/user/1000/keyring"
declare -x GNOME_SETUP_DISPLAY=":1"
declare -x GNOME_SHELL_SESSION_MODE="ubuntu"
declare -x GNOME_TERMINAL_SCREEN="/org/gnome/Terminal/screen/0886bda4_ca43_429c_9e3e_496965e8b417"
...

anngo@anngo-Vostro-5620:~$
```

```bash
anngo@anngo-Vostro-5620:~$ export MY_NAME="AnNgo"

anngo@anngo-Vostro-5620:~$ export MY_PROJECT="DemoProject"

anngo@anngo-Vostro-5620:~$ export GREETING="Hello, world!"

anngo@anngo-Vostro-5620:~$ echo $MY_NAME
AnNgo

anngo@anngo-Vostro-5620:~$ echo $MY_PROJECT
DemoProject

anngo@anngo-Vostro-5620:~$ echo $GREETING
Hello, world!

anngo@anngo-Vostro-5620:~$ printenv
SHELL=/bin/bash
SESSION_MANAGER=local/anngo-Vostro-5620:@/tmp/.ICE-unix/2796,unix/anngo-Vostro-5620:/tmp/.ICE-unix/2796
QT_ACCESSIBILITY=1
COLORTERM=truecolor
XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/etc/xdg
XDG_MENU_PREFIX=gnome-
GNOME_DESKTOP_SESSION_ID=this-is-deprecated
GNOME_KEYRING_CONTROL=/run/user/1000/keyring
GNOME_SHELL_SESSION_MODE=ubuntu
SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
...

anngo@anngo-Vostro-5620:~$
```

### 1.2. `whatis`
`whatis` shows description for user commands, system calls, library functions, and others in manual pages
```bash
whatis something
```
Example:
```bash
anngo@anngo-Vostro-5620:~$ whatis java
java (1)             - launch a Java application

anngo@anngo-Vostro-5620:~$ whatis ls
ls (1)               - list directory contents

anngo@anngo-Vostro-5620:~$ whatis whatis
whatis (1)           - display one-line manual page descriptions

anngo@anngo-Vostro-5620:~$ whatis sudo
sudo (8)             - execute a command as another user

anngo@anngo-Vostro-5620:~$ whatis pwd
pwd (1)              - print name of current/working directory

anngo@anngo-Vostro-5620:~$
```

### 1.3. `whereis`
`whereis` searches for executables, source files, and manual pages using a database built by system automatically.
```bash
whereis name
```

Commonly Used whereis Options

| Option |	Description |
|--------|---------------|
| -b	| Search only for binary (executable) files. |
| -m	| Search only for manual (man) pages. |
| -s	| Search only for source (src) files. |
| -l	| Display the directories being searched by `whereis`. |

Example:
```bash
anngo@anngo-Vostro-5620:~$ whereis java
java: /usr/bin/java /usr/share/java /usr/share/man/man1/java.1.gz

anngo@anngo-Vostro-5620:~$ whereis git
git: /usr/bin/git /usr/share/man/man1/git.1.gz

anngo@anngo-Vostro-5620:~$ whereis google-chrome
google-chrome: /usr/bin/google-chrome /usr/share/man/man1/google-chrome.1.gz

anngo@anngo-Vostro-5620:~$ whereis ls
ls: /usr/bin/ls /usr/share/man/man1/ls.1.gz

anngo@anngo-Vostro-5620:~$
```

```bash
anngo@anngo-Vostro-5620:~$ whereis -b java
java: /usr/bin/java /usr/share/java

anngo@anngo-Vostro-5620:~$ whereis -b pwd
pwd: /usr/bin/pwd

anngo@anngo-Vostro-5620:~$ whereis -b whereis
whereis: /usr/bin/whereis

anngo@anngo-Vostro-5620:~$
```

```bash
anngo@anngo-Vostro-5620:~$ whereis -m java
java: /usr/share/man/man1/java.1.gz

anngo@anngo-Vostro-5620:~$ whereis -m google-chrome
google-chrome: /usr/share/man/man1/google-chrome.1.gz

anngo@anngo-Vostro-5620:~$
```

```bash
anngo@anngo-Vostro-5620:~$ whereis -l
bin: /usr/bin
bin: /usr/sbin
bin: /usr/lib/x86_64-linux-gnu
bin: /usr/lib
bin: /usr/lib64
bin: /etc
bin: /usr/games
bin: /usr/local/bin
bin: /usr/local/sbin
bin: /usr/local/etc
bin: /usr/local/lib
bin: /usr/local/games
bin: /usr/include
bin: /usr/local
bin: /usr/libexec
bin: /usr/share
bin: /snap/bin
man: /usr/share/man/cs
man: /usr/share/man/da
man: /usr/share/man/de
man: /usr/share/man/es
man: /usr/share/man/fi
man: /usr/share/man/fr.ISO8859-1
man: /usr/share/man/fr.UTF-8
man: /usr/share/man/fr
man: /usr/share/man/hr
man: /usr/share/man/hu
man: /usr/share/man/id
man: /usr/share/man/it
man: /usr/share/man/ja
man: /usr/share/man/ko
man: /usr/share/man/man1
man: /usr/share/man/man2
man: /usr/share/man/man3
man: /usr/share/man/man4
man: /usr/share/man/man5
man: /usr/share/man/man6
man: /usr/share/man/man7
man: /usr/share/man/man8
man: /usr/share/man/nl
man: /usr/share/man/pl
man: /usr/share/man/pt
man: /usr/share/man/pt_BR
man: /usr/share/man/ro
man: /usr/share/man/ru
man: /usr/share/man/sl
man: /usr/share/man/sr
man: /usr/share/man/sv
man: /usr/share/man/tr
man: /usr/share/man/uk
man: /usr/share/man/zh_CN
man: /usr/share/man/zh_TW
man: /usr/share/info
src: /usr/src/python3.12
src: /usr/src/linux-hwe-6.11-headers-6.11.0-21
src: /usr/src/linux-headers-6.11.0-21-generic
src: /usr/src/linux-hwe-6.11-headers-6.11.0-24
src: /usr/src/linux-headers-6.11.0-24-generic

anngo@anngo-Vostro-5620:~$
```

### 1.4. `which`
`which` searches for executables in the directories specified by the environment variable `PATH`. This command will print the full path of the executable(s).
```bash
which program_name 
```
Example:
```bash
anngo@anngo-Vostro-5620:~$ which java
/usr/bin/java

anngo@anngo-Vostro-5620:~$ which intellij-idea-community
/snap/bin/intellij-idea-community

anngo@anngo-Vostro-5620:~$
```

### 1.5. `clear`
Clears content on window.

## 2. File Operations

### 2.1. `cat`
It can be used for the following purposes under UNIX or Linux.  
* Display text files on screen
* Copy text files  
* Combine text files  
* Create new text files  
```bash
cat filename
cat file1 file2 
cat file1 file2 > newcombinedfile
cat < file1 > file2 #copy file1 to file2
```

Example:
```bash
anngo@anngo-Vostro-5620:~$ cat file.txt
Hello, this is a sample file.
It contains multiple lines of text.
This is the third line

anngo@anngo-Vostro-5620:~$ cat another_file.txt 
This is another file.
It has some different content.

anngo@anngo-Vostro-5620:~$ cat file.txt another_file.txt 
Hello, this is a sample file.
It contains multiple lines of text.
This is the third line
This is another file.
It has some different content.

anngo@anngo-Vostro-5620:~$ cat file.txt another_file.txt > combined_file.txt

anngo@anngo-Vostro-5620:~$ cat combined_file.txt 
Hello, this is a sample file.
It contains multiple lines of text.
This is the third line
This is another file.
It has some different content.

anngo@anngo-Vostro-5620:~$ cat file.txt > another_file.txt 

anngo@anngo-Vostro-5620:~$ cat another_file.txt 
Hello, this is a sample file.
It contains multiple lines of text.
This is the third line

anngo@anngo-Vostro-5620:~$
```

### 2.2. `chmod`
The chmod command stands for "change mode" and allows you to change the read, write, and execute permissions on your files and folders. For more information on this command check this [link](https://ss64.com/bash/chmod.html).
```bash
chmod -options filename
```
Common Options for chmod
- `+x`:	Add execute permission to the file
- `-x`:	Remove execute permission from the file
- `+r`:	Add read permission to the file
- `-r`:	Remove read permission from the file
- `+w`:	Add write permission to the file
- `-w`:	Remove write permission from the file
- `u`:	User (owner) permissions
- `g`:	Group permissions
- `o`:	Other users' permissions
- `a`:	All users' permissions

Example:
```bash
chmod +x script.sh         # Add execute permission to script.sh
chmod u+x file.txt         # Add execute permission for owner
chmod g-w file.txt         # Remove write permission from group
chmod o=r file.txt         # Set read permission for others only
chmod a+rwx myfolder       # Give read, write, and execute permission to everyone
chmod 755 script.sh        # Set permissions to rwxr-xr-x (755)
```
- 4 (read): Read permission
- 2 (write): Write permission
- 1 (execute): Execute permission

### 2.3. `chown`
The chown (change owner) command allows you to change the user and/or group ownership of a file or directory.

```bash
chown [options] user[:group] filename
```

Common Options:
- `-R`: Recursively change ownership of directory and its contents.
- `-v`: Verbose; show files as they are processed.
- `-f`: Suppress most error messages.

Example:
```bash
chown alice file.txt            # Change owner to 'alice', keep group unchanged
chown alice:developers file.txt # Change owner to 'alice' and group to 'developers'
chown :developers file.txt      # Change only the group to 'developers'
chown -R alice: staff/          # Recursively change owner and group of everything in 'staff' directory
```

### 2.4. `cp`
Copies a file from one location to other.  
```bash
cp filename1 filename2
```
Where `filename1` is the source path to the file and `filename2` is the destination path to the file.

Common options:
- `-r`: Copy directories recursively. Use this option when you want to copy entire directories, including subdirectories and files.
- `-i`: Prompt before overwriting. This option asks for confirmation before overwriting an existing file in the destination.

Example:
```bash
anngo@anngo-Vostro-5620:~$ cp file.txt Documents/

anngo@anngo-Vostro-5620:~$ ls -t
another_file.txt                        actor.csv
combined_file.txt                       snap
file.txt                                WebstormProjects
bash-guide                              AndroidStudioProjects
greet.sh                                Android
Downloads                               Pictures
Desktop                                 Music
IdeaProjects                            Public
Documents                               Templates
SA_CS5                                  Videos
google-chrome-stable_current_amd64.deb

anngo@anngo-Vostro-5620:~$ ls -t Documents/
 file.txt              demo-mysql      ThucHanh                      test.txt
 Typescript-tutorial   dvdrental.sql  'Java streams aggregate.txt'
 password.txt          node_demo       x1.txt
 SA_CS5                money.txt       x2.txt

anngo@anngo-Vostro-5620:~
```

### 2.5. `diff`
Compares files, and lists their differences.  
```bash
anngo@anngo-Vostro-5620:~$ cat file.txt 
Hello, this is a sample file.
It contains multiple lines of text.
This is the third line

anngo@anngo-Vostro-5620:~$ cat another_file.txt 
Hello, this is a sample file.
It contains multiple lines of text.
This is the third line

anngo@anngo-Vostro-5620:~$ diff file.txt combined_file.txt 
3a4,5
> This is another file.
> It has some different content.

anngo@anngo-Vostro-5620:~$ diff file.txt another_file.txt

anngo@anngo-Vostro-5620:~$
```

### 2.6. `file`
Determine file type.  
```bash
file filename
```
Example:
```bash
anngo@anngo-Vostro-5620:~$ ls -t
script.sh       bash-guide    google-chrome-stable_current_amd64.deb  Pictures
folder          greet.sh      actor.csv                               Music
data.csv        Downloads     snap                                    Public
file1.txt       Desktop       WebstormProjects                        Templates
Documents       IdeaProjects  AndroidStudioProjects                   Videos
other_file.txt  SA_CS5        Android
anngo@anngo-Vostro-5620:~$ file greet.sh 
greet.sh: Bourne-Again shell script, ASCII text executable
anngo@anngo-Vostro-5620:~$ file file1.txt
file1.txt: empty
anngo@anngo-Vostro-5620:~$ file other_file.txt 
other_file.txt: ASCII text
anngo@anngo-Vostro-5620:~$ cat greet.sh 
#! /bin/bash

echo "Enter your name:"
read name

echo "Hello $name!"
anngo@anngo-Vostro-5620:~$ cat file1.txt 
anngo@anngo-Vostro-5620:~$ cat other_file.txt 
Hello, this is a sample file.
It contains multiple lines of text.
This is the third line
anngo@anngo-Vostro-5620:~$
```

### 2.7. `find`
Find files in directory
```bash
find directory options pattern
```

Example:
```bash
anngo@anngo-Vostro-5620:~$ ls -t
script.sh       bash-guide    google-chrome-stable_current_amd64.deb  Pictures
folder          greet.sh      actor.csv                               Music
data.csv        Downloads     snap                                    Public
file1.txt       Desktop       WebstormProjects                        Templates
Documents       IdeaProjects  AndroidStudioProjects                   Videos
other_file.txt  SA_CS5        Android

anngo@anngo-Vostro-5620:~$ find -type d -name "Android"
./Android

anngo@anngo-Vostro-5620:~$ find -type f -size +100M
./.local/share/torbrowser/tbb/x86_64/tor-browser/Browser/libxul.so

anngo@anngo-Vostro-5620:~$ find . -type f -name "*.log" -exec rm {} \;
```

### 2.8. `gunzip`
The gunzip command is used to decompress files that were compressed using the gzip command. It removes the .gz extension and restores the original file.
```bash
gunzip filename
```

Example:
```bash
anngo@anngo-Vostro-5620:~$ ls -t
script.sh       bash-guide    google-chrome-stable_current_amd64.deb  Pictures
folder          greet.sh      actor.csv.gz                            Music
data.csv        Downloads     snap                                    Public
file1.txt       Desktop       WebstormProjects                        Templates
Documents       IdeaProjects  AndroidStudioProjects                   Videos
other_file.txt  SA_CS5        Android

anngo@anngo-Vostro-5620:~$ gunzip actor.csv.gz 

anngo@anngo-Vostro-5620:~$ ls -t
script.sh       bash-guide    google-chrome-stable_current_amd64.deb  Pictures
folder          greet.sh      actor.csv                               Music
data.csv        Downloads     snap                                    Public
file1.txt       Desktop       WebstormProjects                        Templates
Documents       IdeaProjects  AndroidStudioProjects                   Videos
other_file.txt  SA_CS5        Android

anngo@anngo-Vostro-5620:~$ 
```

### 2.9. `gzcat`
Lets you look at gzipped file without actually having to gunzip it.  
```bash
gzcat filename
```

Example:
```bash
anngo@anngo-Vostro-5620:~$ ls -t
script.sh       bash-guide    google-chrome-stable_current_amd64.deb  Pictures
folder          greet.sh      actor.csv.gz                            Music
data.csv        Downloads     snap                                    Public
file1.txt       Desktop       WebstormProjects                        Templates
Documents       IdeaProjects  AndroidStudioProjects                   Videos
other_file.txt  SA_CS5        Android

anngo@anngo-Vostro-5620:~$ gzip other_file.txt 

anngo@anngo-Vostro-5620:~$ ls -t
script.sh          google-chrome-stable_current_amd64.deb
folder             actor.csv.gz
data.csv           snap
file1.txt          WebstormProjects
Documents          AndroidStudioProjects
other_file.txt.gz  Android
bash-guide         Pictures
greet.sh           Music
Downloads          Public
Desktop            Templates
IdeaProjects       Videos
SA_CS5

anngo@anngo-Vostro-5620:~$ zcat other_file.txt.gz 
Hello, this is a sample file.
It contains multiple lines of text.
This is the third line

anngo@anngo-Vostro-5620:~$
```

### 2.10. `gzip`
The gzip command is used to compress files using the GNU zip compression algorithm. It replaces the original file with a compressed version and adds the .gz extension.
```bash
gzip filename
```
Common options:
- `-k`: Keep the original file after compression.
- `-d`: Decompress a .gz file (same as gunzip).
- `-v`: Verbose output, shows compression details.
- `-r`: Recursively compress all files in a directory.

Example:
```bash
anngo@anngo-Vostro-5620:~$ ls -t
script.sh       bash-guide    google-chrome-stable_current_amd64.deb  Pictures
folder          greet.sh      actor.csv                               Music
data.csv        Downloads     snap                                    Public
file1.txt       Desktop       WebstormProjects                        Templates
Documents       IdeaProjects  AndroidStudioProjects                   Videos
other_file.txt  SA_CS5        Android

anngo@anngo-Vostro-5620:~$ gzip actor.csv 

anngo@anngo-Vostro-5620:~$ ls -t
script.sh       bash-guide    google-chrome-stable_current_amd64.deb  Pictures
folder          greet.sh      actor.csv.gz                            Music
data.csv        Downloads     snap                                    Public
file1.txt       Desktop       WebstormProjects                        Templates
Documents       IdeaProjects  AndroidStudioProjects                   Videos
other_file.txt  SA_CS5        Android

anngo@anngo-Vostro-5620:~$
```

### 2.11. `head`
The head command is used to display the first few lines (default: 10) of a file. It is useful for quickly viewing the beginning content of a file.
```bash
head -n file.txt # n default 10
```

Example:
```bash
anngo@anngo-Vostro-5620:~$ cat file.txt 
Hello, this is a sample file.
It contains multiple lines of text.
This is the third line.
This is 4th line.
This is 5th line.
This is 6th line.
7
8
9
10
11

anngo@anngo-Vostro-5620:~$ head file.txt 
Hello, this is a sample file.
It contains multiple lines of text.
This is the third line.
This is 4th line.
This is 5th line.
This is 6th line.
7
8
9
10

anngo@anngo-Vostro-5620:~$ head -5 file.txt 
Hello, this is a sample file.
It contains multiple lines of text.
This is the third line.
This is 4th line.
This is 5th line.

anngo@anngo-Vostro-5620:~$
```

### 2.12. `less`
Shows the contents of a file or a command output, one page at a time. It is similar to [more](#q-more), but has more advanced features and allows you to navigate both forward and backward through the file.  
```bash
less filename
```

### 2.13. `ls`
The `ls` command lists files and directories in the current working directory. It supports many options to customize the output.

Syntax:
```bash
ls [OPTION]... [FILE]...
```
Common Options:
- `-l`: Use long listing format (includes permissions, ownership, size, and modification date).
- `-a`: Include hidden files (those starting with .).
- `-h`: With -l, print sizes in human-readable format (e.g., 1K, 234M).
- `-R`: List subdirectories recursively.
- `-S`: Sort files by size (largest first).
- `-t`: Sort by modification time (newest first).
- `-r`: Reverse order while sorting.

Example:
```bash
anngo@anngo-Vostro-5620:~$ ls -l
total 112636
-rw-rw-r--  1 anngo anngo         0 Apr  5 17:04 actor.csv
drwxrwxr-x  3 anngo anngo      4096 Mar  6 15:19 Android
drwxrwxr-x  3 anngo anngo      4096 Mar  7 17:14 AndroidStudioProjects
drwxrwxr-x  4 anngo anngo      4096 May  2 08:25 bash-guide
drwxr-xr-x  2 anngo anngo      4096 Apr 24 16:27 Desktop
drwxr-xr-x  7 anngo anngo      4096 May  2 09:46 Documents
drwxr-xr-x 14 anngo anngo      4096 Apr 26 21:23 Downloads
-rw-rw-r--  1 anngo anngo 115264952 Apr  9 00:27 google-chrome-stable_current_amd64.deb
-rw-rw-r--  1 anngo anngo        69 May  1 23:06 greet.sh
drwxrwxr-x  7 anngo anngo      4096 Apr 20 13:55 IdeaProjects
drwxr-xr-x  2 anngo anngo      4096 Dec  6 19:04 Music
-rw-rw-r--  1 anngo anngo        89 May  2 09:23 other_file.txt
drwxr-xr-x  3 anngo anngo      4096 Feb  5 17:54 Pictures
drwxr-xr-x  2 anngo anngo      4096 Dec  6 19:04 Public
drwxrwxr-x  6 anngo anngo      4096 Apr 18 14:39 SA_CS5
drwx------ 13 anngo anngo      4096 Apr  4 23:28 snap
drwxr-xr-x  2 anngo anngo      4096 Dec  6 19:04 Templates
drwxr-xr-x  2 anngo anngo      4096 Dec  6 19:04 Videos
drwxrwxr-x  5 anngo anngo      4096 Mar 11 10:39 WebstormProjects

anngo@anngo-Vostro-5620:~$ ls -t
Documents       SA_CS5                                  Pictures
other_file.txt  google-chrome-stable_current_amd64.deb  Music
bash-guide      actor.csv                               Public
greet.sh        snap                                    Templates
Downloads       WebstormProjects                        Videos
Desktop         AndroidStudioProjects
IdeaProjects    Android

anngo@anngo-Vostro-5620:~$ ls -l -a
total 112908
drwxr-x--- 37 anngo anngo      4096 May  2 09:49 .
drwxr-xr-x  3 root  root       4096 Feb 18 11:21 ..
-rw-rw-r--  1 anngo anngo         0 Apr  5 17:04 actor.csv
drwxrwxr-x  4 anngo anngo      4096 Mar  7 17:17 .android
drwxrwxr-x  3 anngo anngo      4096 Mar  6 15:19 Android
drwxrwxr-x  3 anngo anngo      4096 Mar  7 17:14 AndroidStudioProjects
drwxrwxr-x  4 anngo anngo      4096 May  2 08:25 bash-guide
-rw-------  1 anngo anngo     49639 May  2 09:43 .bash_history
-rw-------  1 anngo anngo     42157 Mar  2 11:48 .bash_history-04281.tmp
-rw-------  1 anngo anngo     42171 Feb 20 15:27 .bash_history-07195.tmp
-rw-------  1 anngo anngo         0 Apr 23 09:41 .bash_history-14693.tmp
-rw-------  1 anngo anngo         0 Mar  4 00:30 .bash_history-25422.tmp
-rw-r--r--  1 anngo anngo       220 Mar 31  2024 .bash_logout
-rw-r--r--  1 anngo anngo      3771 Mar 31  2024 .bashrc
drwx------ 29 anngo anngo      4096 Apr 23 09:41 .cache
drwx------ 30 anngo anngo      4096 Apr 26 16:05 .config
drwxr-xr-x  2 anngo anngo      4096 Apr 24 16:27 Desktop
drwxr-xr-x  7 anngo anngo      4096 May  2 09:46 Documents
drwxrwxr-x  3 anngo anngo      4096 Dec  7 10:41 .dotnet
drwxr-xr-x 14 anngo anngo      4096 Apr 26 21:23 Downloads
-rw-rw-r--  1 anngo anngo       136 Apr  2 16:20 .gitconfig
drwxrwxr-x  2 anngo anngo      4096 May  2 08:25 .gk
drwx------  2 anngo anngo      4096 Apr 16 13:34 .gnupg
-rw-rw-r--  1 anngo anngo 115264952 Apr  9 00:27 google-chrome-stable_current_amd64.deb
drwxrwxr-x 10 anngo anngo      4096 Mar  7 17:16 .gradle
-rw-rw-r--  1 anngo anngo        69 May  1 23:06 greet.sh
drwxrwxr-x  7 anngo anngo      4096 Apr 20 13:55 IdeaProjects
drwxrwxr-x  4 anngo anngo      4096 Feb  7 17:37 .java
drwxrwxr-x  3 anngo anngo      4096 Feb  7 21:15 .jdks
-rw-------  1 anngo anngo        20 May  2 08:52 .lesshst
drwx------  4 anngo anngo      4096 Dec  6 19:04 .local
drwxrwxr-x  4 anngo anngo      4096 Feb  7 17:54 .m2
drwx------  4 anngo anngo      4096 Apr  8 21:12 .mongodb
drwxr-xr-x  2 anngo anngo      4096 Dec  6 19:04 Music
-rw-------  1 anngo anngo       133 Apr  5 07:56 .mysql_history
drwxrwxr-x  6 anngo anngo      4096 Mar  7 00:38 .npm
drwxrwxr-x  3 anngo anngo      4096 Feb  7 17:56 .openjfx
-rw-rw-r--  1 anngo anngo        89 May  2 09:23 other_file.txt
drwx------  5 anngo anngo      4096 Apr 17 23:40 .pgadmin
drwxr-xr-x  3 anngo anngo      4096 Feb  5 17:54 Pictures
drwx------  3 anngo anngo      4096 Dec  7 10:27 .pki
-rw-r--r--  1 anngo anngo       807 Mar 31  2024 .profile
drwxr-xr-x  2 anngo anngo      4096 Dec  6 19:04 Public
drwxrwxr-x  6 anngo anngo      4096 Apr 18 14:39 SA_CS5
drwx------ 13 anngo anngo      4096 Apr  4 23:28 snap
drwx------  2 anngo anngo      4096 Dec  6 19:04 .ssh
-rw-r--r--  1 anngo anngo         0 Dec  6 21:51 .sudo_as_admin_successful
drwxr-xr-x  2 anngo anngo      4096 Dec  6 19:04 Templates
drwx------  3 anngo anngo      4096 Apr 14 21:32 .tor
drwxr-xr-x  2 anngo anngo      4096 Dec  6 19:04 Videos
-rw-------  1 anngo anngo      9426 Mar  3 17:34 .viminfo
drwxrwxr-x  4 anngo anngo      4096 Dec  7 10:28 .vscode
drwxrwxr-x  5 anngo anngo      4096 Mar 11 10:39 WebstormProjects
-rw-rw-r--  1 anngo anngo       215 Apr 16 17:47 .wget-hsts
-rw-rw-r--  1 anngo anngo       131 Dec  6 22:02 .xinputrc
drwx------  8 anngo anngo      4096 Apr 26 16:05 .zoom

anngo@anngo-Vostro-5620:~$
```

| Field Position | Example Value           | Description                                                                 |
|----------------|-------------------------|-----------------------------------------------------------------------------|
| 1              | `-rw-rw-r--`            | File type and permissions (explained below)                                |
| 2              | `1`                     | Number of hard links                                                        |
| 3              | `anngo`                 | Owner (user) of the file                                                    |
| 4              | `anngo`                 | Group of the file                                                           |
| 5              | `115264952`             | File size in bytes                                                          |
| 6              | `Apr  9`                | Last modified month and day                                                |
| 7              | `00:27` or `2024`       | Last modified time (if within 6 months) or year (if older than 6 months)   |
| 8              | `google-chrome...deb`   | File or directory name                                                      |


The first character indicates the file type:

- `-` : regular file
- `d` : directory
- `l` : symbolic link
- `c` : character device file
- `b` : block device file
- `s` : socket
- `p` : named pipe (FIFO)

The next 9 characters are the permissions:

| Position | Meaning             |
|----------|---------------------|
| 2-4      | Owner permissions   |
| 5-7      | Group permissions   |
| 8-10     | Others' permissions |

Each set can contain:

- `r` = read
- `w` = write
- `x` = execute
- `-` = no permission

### 2.14. `more`
Shows the first part of a file (move with space and type q to quit).  
```bash
more filename
```

### 2.15. `mv`
Moves a file from one location to other.  
```bash
mv filename1 filename2
```
Where `filename1` is the source path to the file and `filename2` is the destination path to the file.

Also it can be used for rename a file.
```bash
mv old_name new_name
```

Example:
```bash
nngo@anngo-Vostro-5620:~$ ls -t
Documents                               actor.csv
file.txt                                snap
another_file.txt                        WebstormProjects
combined_file.txt                       AndroidStudioProjects
bash-guide                              Android
greet.sh                                Pictures
Downloads                               Music
Desktop                                 Public
IdeaProjects                            Templates
SA_CS5                                  Videos
google-chrome-stable_current_amd64.deb

anngo@anngo-Vostro-5620:~$ mv file.txt Documents/

anngo@anngo-Vostro-5620:~$ ls -t
Documents          IdeaProjects                            Android
another_file.txt   SA_CS5                                  Pictures
combined_file.txt  google-chrome-stable_current_amd64.deb  Music
bash-guide         actor.csv                               Public
greet.sh           snap                                    Templates
Downloads          WebstormProjects                        Videos
Desktop            AndroidStudioProjects

anngo@anngo-Vostro-5620:~$ ls -t Documents/
 file.txt              demo-mysql      ThucHanh                      test.txt
 Typescript-tutorial   dvdrental.sql  'Java streams aggregate.txt'
 password.txt          node_demo       x1.txt
 SA_CS5                money.txt       x2.txt

anngo@anngo-Vostro-5620:~$ mv another_file.txt other_file.txt

anngo@anngo-Vostro-5620:~$ ls -t
Documents          IdeaProjects                            Android
other_file.txt     SA_CS5                                  Pictures
combined_file.txt  google-chrome-stable_current_amd64.deb  Music
bash-guide         actor.csv                               Public
greet.sh           snap                                    Templates
Downloads          WebstormProjects                        Videos
Desktop            AndroidStudioProjects

anngo@anngo-Vostro-5620:~$
```

### 2.16. `rm`
Removes a file. Using this command on a directory gives you an error.
`rm: directory: is a directory`
To remove a directory you have to pass `-r` which will remove the content of the directory recursively. Optionally you can use `-f` flag to force the deletion i.e. without any confirmations etc.
```bash
rm filename
```

Example:
```bash
anngo@anngo-Vostro-5620:~$ mkdir demo

anngo@anngo-Vostro-5620:~$ cd demo/

anngo@anngo-Vostro-5620:~/demo$ touch file1.txt file2.txt

anngo@anngo-Vostro-5620:~/demo$ cd ..

anngo@anngo-Vostro-5620:~$ ls -t
demo                                    actor.csv
Documents                               snap
other_file.txt                          WebstormProjects
combined_file.txt                       AndroidStudioProjects
bash-guide                              Android
greet.sh                                Pictures
Downloads                               Music
Desktop                                 Public
IdeaProjects                            Templates
SA_CS5                                  Videos
google-chrome-stable_current_amd64.deb

anngo@anngo-Vostro-5620:~$ rm combined_file.txt 

anngo@anngo-Vostro-5620:~$ ls -t
demo            IdeaProjects                            Android
Documents       SA_CS5                                  Pictures
other_file.txt  google-chrome-stable_current_amd64.deb  Music
bash-guide      actor.csv                               Public
greet.sh        snap                                    Templates
Downloads       WebstormProjects                        Videos
Desktop         AndroidStudioProjects

anngo@anngo-Vostro-5620:~$ ls -t demo/
file1.txt  file2.txt

anngo@anngo-Vostro-5620:~$ rm -r demo/

anngo@anngo-Vostro-5620:~$ ls -t
Documents       SA_CS5                                  Pictures
other_file.txt  google-chrome-stable_current_amd64.deb  Music
bash-guide      actor.csv                               Public
greet.sh        snap                                    Templates
Downloads       WebstormProjects                        Videos
Desktop         AndroidStudioProjects
IdeaProjects    Android

anngo@anngo-Vostro-5620:~$
```

### 2.17. `tail`
The tail command displays the last part (by default, the last 10 lines) of a file. It's useful for checking recent entries in log files or monitoring file changes in real-time.

```bash
tail -n filename # n default 10
```

Example:
```bash
anngo@anngo-Vostro-5620:~$ tail file.txt
This is 3rd line.
This is 4th line.
This is 5th line.
This is 6th line.
7
8
9
10
11
12

anngo@anngo-Vostro-5620:~$ tail -5 file.txt
8
9
10
11
12

anngo@anngo-Vostro-5620:~$
```

### 2.18. `touch`
Updates access and modification time stamps of your file. If it doesn't exists, it'll be created.
```bash
touch [options] filename
```

Common Options for touch
- `-c`:	Do not create the file if it does not exist
- `-a`:	Change only the access time
- `-m`:	Change only the modification time
- `-t [[CC]YY]MMDDhhmm[.ss]`:	Use a specific timestamp (custom date and time)

Example:
```bash
anngo@anngo-Vostro-5620:~$ touch file1.txt
anngo@anngo-Vostro-5620:~$ ls -t
file1.txt       IdeaProjects                            Android
Documents       SA_CS5                                  Pictures
other_file.txt  google-chrome-stable_current_amd64.deb  Music
bash-guide      actor.csv                               Public
greet.sh        snap                                    Templates
Downloads       WebstormProjects                        Videos
Desktop         AndroidStudioProjects

anngo@anngo-Vostro-5620:~$
```

## 3. Text Operations

### 3.1. `awk`
`awk` is the most useful command for handling text files. It operates on an entire file line by line. By default it uses whitespace to separate the fields. The most common syntax for awk command is

```bash
awk 'search_pattern' '{ action_to_take_if_pattern_matches; }' file_to_parse
```

Lets take following file `/etc/passwd`. Here's the sample data that this file contains:
```
root:x:0:0:root:/root:/usr/bin/zsh
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
```

So now lets get only username from this file. Where `-F` specifies that on which base we are going to separate the fields. In our case it's `:`. `{ print $1 }` means print out the first matching field.
```bash
awk -F ':' '{ print $1 }' /etc/passwd
```
After running the above command you will get following output.
```
root
daemon
bin
sys
sync
```
For more detail on how to use `awk`, check following [link](https://www.cyberciti.biz/faq/bash-scripting-using-awk).


### 3.2. `cut`
The `cut` command is used to extract specific sections from each line of a file or from standard input. It allows you to cut out columns, characters, or fields based on delimiters.
```bash
cut OPTION [FILE...]
```
- `-f`: Specify the field number to extract. Fields are typically delimited by a specified character (default is tab).
- `-d`: Define the delimiter that separates the fields (default is tab).
- `-c`: Specify the character positions to extract instead of fields.

Example:
```bash
anngo@anngo-Vostro-5620:~$ cat actor.csv 
id,name,age,grade
1,Alice,20,A
2,Bob,21,B
3,Charlie,19,A
4,Diana,22,C
5,Evan,20,B

anngo@anngo-Vostro-5620:~$ cut -f 2,3 -d ',' actor.csv 
name,age
Alice,20
Bob,21
Charlie,19
Diana,22
Evan,20

anngo@anngo-Vostro-5620:~$ cut -d ',' -f 2 actor.csv
name
Alice
Bob
Charlie
Diana
Evan

anngo@anngo-Vostro-5620:~$
```

### 3.3. `echo`
Display a line of text
```bash
echo [options] [string]
```
- `-n`: No newline character at the end (does not move to a new line after printing).
- `-e`: Enable special characters, such as \n (newline), \t (tab), \\ (backslash).

Example:
```bash
anngo@anngo-Vostro-5620:~$ echo "Hello world"
Hello world

anngo@anngo-Vostro-5620:~$ echo "Hello\nworld\n"
Hello\nworld\n

anngo@anngo-Vostro-5620:~$ echo -e "Hello\nworld\n"
Hello
world


anngo@anngo-Vostro-5620:~$ echo -n "Hello\nworld\n"

Hello\nworld\nanngo@anngo-Vostro-5620:~$
```

### 3.4. `fmt`
The `fmt` command in Linux is used to format text paragraphs, wrapping lines to a specified width for better readability.
```bash
fmt [OPTION]... [FILE]...
```
- `-w N`: Set maximum line width to N characters (default is 75).
- `-s`: Split lines only at sentence endings.
- `-u`: Uniform spacing: removes extra spaces and trims lines.

Example:
```bash
anngo@anngo-Vostro-5620:~$ cat example.txt
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
anngo@anngo-Vostro-5620:~$ cat example.txt | fmt -w 20
Lorem ipsum
dolor sit amet,
consetetur
sadipscing elitr,
sed diam nonumy
eirmod tempor
invidunt ut labore
et dolore magna
aliquyam erat, sed
diam voluptua. At
vero eos et
accusam et justo
duo dolores et ea
rebum. Stet clita
kasd gubergren,
no sea takimata
sanctus est Lorem
ipsum dolor sit
amet.

anngo@anngo-Vostro-5620:~$
```

### 3.5. `grep`
The `grep` command is used to search for specific patterns within files. It stands for "global regular expression print," and it allows you to search for text that matches regular expressions and prints the matching lines to the terminal.
```bash
grep [options] pattern [file...]
```
- `pattern`: The text or regular expression you want to search for.
- `file`: The file(s) to search through.

Common Options for grep:
- `-i`: Ignore case (case-insensitive search).
- `-r` or `-R`: Recursively search directories.
- `-l`: Display only the names of files with matching lines.
- `-n`: Show line numbers of matching lines.

Example:
```bash
anngo@anngo-Vostro-5620:~$ grep 'Linux' file1.txt 
Hello, welcome to the world of Linux!
It's a great way to learn Linux commands.
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
Many popular websites and servers run on Linux-based systems because of its stability and performance.
If you want to get deeper into Linux, there are many resources available online to help you learn.
Hello, welcome to the world of Linux!
Hello, welcome to the world of Linux!
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.

anngo@anngo-Vostro-5620:~$ grep -i 'linux' file1.txt 
Hello, welcome to the world of Linux!
It's a great way to learn Linux commands.
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
Many popular websites and servers run on Linux-based systems because of its stability and performance.
If you want to get deeper into Linux, there are many resources available online to help you learn.
Hello, welcome to the world of Linux!
Hello, welcome to the world of Linux!
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.

anngo@anngo-Vostro-5620:~$ grep -n 'Linux' file1.txt 
1:Hello, welcome to the world of Linux!
4:It's a great way to learn Linux commands.
5:Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
6:Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
8:Many popular websites and servers run on Linux-based systems because of its stability and performance.
9:If you want to get deeper into Linux, there are many resources available online to help you learn.
10:Hello, welcome to the world of Linux!
11:Hello, welcome to the world of Linux!
12:Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.

anngo@anngo-Vostro-5620:~$ 
```

### 3.6. `nl`
The `nl` command in Linux is used to number the lines of a file or output. It adds line numbers to the output, making it easier to track line numbers in text files.
```bash
nl [OPTION]... [FILE]...
```

Example:
```bash
anngo@anngo-Vostro-5620:~$ nl file1.txt 
     1	Hello, welcome to the world of Linux!
     2	This is a simple example to test the wc command.
     3	We will count the lines, words, and characters in this file.
     4	It's a great way to learn Linux commands.
     5	Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
     6	Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
     7	It is open-source, which means anyone can contribute to its development and modify it as per their needs.
     8	Many popular websites and servers run on Linux-based systems because of its stability and performance.
     9	If you want to get deeper into Linux, there are many resources available online to help you learn.
    10	Hello, welcome to the world of Linux!
    11	Hello, welcome to the world of Linux!
    12	Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.

anngo@anngo-Vostro-5620:~$ nl -s ": " file1.txt 
     1: Hello, welcome to the world of Linux!
     2: This is a simple example to test the wc command.
     3: We will count the lines, words, and characters in this file.
     4: It's a great way to learn Linux commands.
     5: Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
     6: Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
     7: It is open-source, which means anyone can contribute to its development and modify it as per their needs.
     8: Many popular websites and servers run on Linux-based systems because of its stability and performance.
     9: If you want to get deeper into Linux, there are many resources available online to help you learn.
    10: Hello, welcome to the world of Linux!
    11: Hello, welcome to the world of Linux!
    12: Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.

anngo@anngo-Vostro-5620:~$ nl -v 10 file1.txt 
    10	Hello, welcome to the world of Linux!
    11	This is a simple example to test the wc command.
    12	We will count the lines, words, and characters in this file.
    13	It's a great way to learn Linux commands.
    14	Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
    15	Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
    16	It is open-source, which means anyone can contribute to its development and modify it as per their needs.
    17	Many popular websites and servers run on Linux-based systems because of its stability and performance.
    18	If you want to get deeper into Linux, there are many resources available online to help you learn.
    19	Hello, welcome to the world of Linux!
    20	Hello, welcome to the world of Linux!
    21	Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
anngo@anngo-Vostro-5620:~$
```




### 3.7. `sort`
`sort` is used to arrange lines in a file or input in alphabetical, numerical, or reverse order.

- `-r`: Reverse the result of comparisons
- `-n`: Compare according to numerical value
- `-k N`: Sort by column number N
- `-t CHAR`: Use CHAR as the field delimiter

Example:
```bash
anngo@anngo-Vostro-5620:~$ sort -n number.txt 
0
1
2
3
4
5
7
8
9
10
12
15

anngo@anngo-Vostro-5620:~$ sort file1.txt 
Hello, welcome to the world of Linux!
Hello, welcome to the world of Linux!
Hello, welcome to the world of Linux!
If you want to get deeper into Linux, there are many resources available online to help you learn.
It is open-source, which means anyone can contribute to its development and modify it as per their needs.
It's a great way to learn Linux commands.
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
Many popular websites and servers run on Linux-based systems because of its stability and performance.
This is a simple example to test the wc command.
We will count the lines, words, and characters in this file.

anngo@anngo-Vostro-5620:~$ sort -r file1.txt 
We will count the lines, words, and characters in this file.
This is a simple example to test the wc command.
Many popular websites and servers run on Linux-based systems because of its stability and performance.
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
It's a great way to learn Linux commands.
It is open-source, which means anyone can contribute to its development and modify it as per their needs.
If you want to get deeper into Linux, there are many resources available online to help you learn.
Hello, welcome to the world of Linux!
Hello, welcome to the world of Linux!
Hello, welcome to the world of Linux!

anngo@anngo-Vostro-5620:~$ sort -t ',' -k 2 actor.csv 
1,Alice,20,A
2,Bob,21,B
3,Charlie,19,A
4,Diana,22,C
5,Evan,20,B
id,name,age,grade

anngo@anngo-Vostro-5620:~$ sort -t ',' -k 3 -r actor.csv 
id,name,age,grade
4,Diana,22,C
2,Bob,21,B
5,Evan,20,B
1,Alice,20,A
3,Charlie,19,A

anngo@anngo-Vostro-5620:~$
```

### 3.8. `tr`
Translate or delete characters
```bash
tr [OPTION] SET1 [SET2]
```

Example:
```bash
anngo@anngo-Vostro-5620:~$ cat file1.txt 
Hello, welcome to the world of Linux!
This is a simple example to test the wc command.
We will count the lines, words, and characters in this file.
It's a great way to learn Linux commands.
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
It is open-source, which means anyone can contribute to its development and modify it as per their needs.
Many popular websites and servers run on Linux-based systems because of its stability and performance.
If you want to get deeper into Linux, there are many resources available online to help you learn.
Hello, welcome to the world of Linux!
Hello, welcome to the world of Linux!
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.

anngo@anngo-Vostro-5620:~$ cat file1.txt | tr 'a-z' 'A-Z'
HELLO, WELCOME TO THE WORLD OF LINUX!
THIS IS A SIMPLE EXAMPLE TO TEST THE WC COMMAND.
WE WILL COUNT THE LINES, WORDS, AND CHARACTERS IN THIS FILE.
IT'S A GREAT WAY TO LEARN LINUX COMMANDS.
LINUX IS A POWERFUL OPERATING SYSTEM THAT IS WIDELY USED BY DEVELOPERS, SYSTEM ADMINISTRATORS, AND HOBBYISTS.
LINUX IS A POWERFUL OPERATING SYSTEM THAT IS WIDELY USED BY DEVELOPERS, SYSTEM ADMINISTRATORS, AND HOBBYISTS.
IT IS OPEN-SOURCE, WHICH MEANS ANYONE CAN CONTRIBUTE TO ITS DEVELOPMENT AND MODIFY IT AS PER THEIR NEEDS.
MANY POPULAR WEBSITES AND SERVERS RUN ON LINUX-BASED SYSTEMS BECAUSE OF ITS STABILITY AND PERFORMANCE.
IF YOU WANT TO GET DEEPER INTO LINUX, THERE ARE MANY RESOURCES AVAILABLE ONLINE TO HELP YOU LEARN.
HELLO, WELCOME TO THE WORLD OF LINUX!
HELLO, WELCOME TO THE WORLD OF LINUX!
LINUX IS A POWERFUL OPERATING SYSTEM THAT IS WIDELY USED BY DEVELOPERS, SYSTEM ADMINISTRATORS, AND HOBBYISTS.

anngo@anngo-Vostro-5620:~$ cat file1.txt | tr -d 'aioueAIOUE'
Hll, wlcm t th wrld f Lnx!
Ths s  smpl xmpl t tst th wc cmmnd.
W wll cnt th lns, wrds, nd chrctrs n ths fl.
t's  grt wy t lrn Lnx cmmnds.
Lnx s  pwrfl prtng systm tht s wdly sd by dvlprs, systm dmnstrtrs, nd hbbysts.
Lnx s  pwrfl prtng systm tht s wdly sd by dvlprs, systm dmnstrtrs, nd hbbysts.
t s pn-src, whch mns nyn cn cntrbt t ts dvlpmnt nd mdfy t s pr thr nds.
Mny pplr wbsts nd srvrs rn n Lnx-bsd systms bcs f ts stblty nd prfrmnc.
f y wnt t gt dpr nt Lnx, thr r mny rsrcs vlbl nln t hlp y lrn.
Hll, wlcm t th wrld f Lnx!
Hll, wlcm t th wrld f Lnx!
Lnx s  pwrfl prtng systm tht s wdly sd by dvlprs, systm dmnstrtrs, nd hbbysts.

anngo@anngo-Vostro-5620:~$
```

### 3.9. `uniq`
The `uniq` command is used to filter out repeated lines in a file or input. It only prints unique lines, and it can also count occurrences of each line.
```bash
uniq [options] filename
```

Example:
```bash
anngo@anngo-Vostro-5620:~$ cat file1.txt 
Hello, welcome to the world of Linux!
This is a simple example to test the wc command.
We will count the lines, words, and characters in this file.
It's a great way to learn Linux commands.
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
It is open-source, which means anyone can contribute to its development and modify it as per their needs.
Many popular websites and servers run on Linux-based systems because of its stability and performance.
If you want to get deeper into Linux, there are many resources available online to help you learn.
Hello, welcome to the world of Linux!
Hello, welcome to the world of Linux!
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.

anngo@anngo-Vostro-5620:~$ uniq file1.txt 
Hello, welcome to the world of Linux!
This is a simple example to test the wc command.
We will count the lines, words, and characters in this file.
It's a great way to learn Linux commands.
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
It is open-source, which means anyone can contribute to its development and modify it as per their needs.
Many popular websites and servers run on Linux-based systems because of its stability and performance.
If you want to get deeper into Linux, there are many resources available online to help you learn.
Hello, welcome to the world of Linux!
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
anngo@anngo-Vostro-5620:~$
```

### 3.10. `wc`
Tells you how many lines, words and characters there are in a file.  
```bash
wc [options] filename
```
- `-l`: Count lines only.
- `-w`: Count words only.
- `-c`: Count characters only.
- `-m`: Count characters (including multi-byte characters).

Example:
```bash
anngo@anngo-Vostro-5620:~$ cat file1.txt 
Hello, welcome to the world of Linux!
This is a simple example to test the wc command.
We will count the lines, words, and characters in this file.
It's a great way to learn Linux commands.
Linux is a powerful operating system that is widely used by developers, system administrators, and hobbyists.
It is open-source, which means anyone can contribute to its development and modify it as per their needs.
Many popular websites and servers run on Linux-based systems because of its stability and performance.
If you want to get deeper into Linux, there are many resources available online to help you learn.

anngo@anngo-Vostro-5620:~$ wc -l file1.txt 
8 file1.txt

anngo@anngo-Vostro-5620:~$ wc -w file1.txt 
103 file1.txt

anngo@anngo-Vostro-5620:~$ wc -m file1.txt 
608 file1.txt

anngo@anngo-Vostro-5620:~$ wc -c file1.txt 
608 file1.txt

anngo@anngo-Vostro-5620:~$ wc file1.txt 
  8 103 608 file1.txt

anngo@anngo-Vostro-5620:~$
```

## 4. Directory Operations

### 4.1. `cd`
The `cd` command is used to move from one directory to another.
```bash
$ cd/path/to/directory
```

Example:
```bash
anngo@anngo-Vostro-5620:~$ pwd
/home/anngo

anngo@anngo-Vostro-5620:~$ ls -t
example.txt        IdeaProjects
number.txt         SA_CS5
actor.csv          google-chrome-stable_current_amd64.deb
file1.txt          snap
script.sh          WebstormProjects
folder             AndroidStudioProjects
data.csv           Android
Documents          Pictures
other_file.txt.gz  Music
bash-guide         Public
greet.sh           Templates
Downloads          Videos
Desktop

anngo@anngo-Vostro-5620:~$ cd Downloads/

anngo@anngo-Vostro-5620:~/Downloads$ cd /

anngo@anngo-Vostro-5620:/$
```

### 4.2. `mkdir`
Makes a new directory.  
```bash
mkdir dirname
```
You can use this to create multiple directories at once within your current directory.
```bash
mkdir 1stDirectory 2ndDirectory 3rdDirectory
```
You can also use this to create parent directories at the same time with the -p (or --parents) flag. For instance, if you wanted a directory named 'project1' in another subdirectory at '/samples/bash/projects/', you could run:
```bash 
mkdir -p /samples/bash/projects/project1
mkdir --parents /samples/bash/projects/project1
```
Both commands above will do the same thing.
If any of these directories did no already exist, they would be created as well.

### 4.3. `pwd`
Tells you which directory you currently are in.  
```bash
pwd
```

Example:
```bash
anngo@anngo-Vostro-5620:~$ pwd
/home/anngo

anngo@anngo-Vostro-5620:~$ ls -t
example.txt        IdeaProjects
number.txt         SA_CS5
actor.csv          google-chrome-stable_current_amd64.deb
file1.txt          snap
script.sh          WebstormProjects
folder             AndroidStudioProjects
data.csv           Android
Documents          Pictures
other_file.txt.gz  Music
bash-guide         Public
greet.sh           Templates
Downloads          Videos
Desktop

anngo@anngo-Vostro-5620:~$
```

### 4.4 `rmdir`
The rmdir command is used to delete empty directories.
It cannot remove a directory that contains files or subdirectories.
```bash
rmdir folder
```

Example:
```bash
anngo@anngo-Vostro-5620:~$ ls -t
example.txt        IdeaProjects
number.txt         SA_CS5
actor.csv          google-chrome-stable_current_amd64.deb
file1.txt          snap
script.sh          WebstormProjects
folder             AndroidStudioProjects
data.csv           Android
Documents          Pictures
other_file.txt.gz  Music
bash-guide         Public
greet.sh           Templates
Downloads          Videos
Desktop

anngo@anngo-Vostro-5620:~$ mkdir demo

anngo@anngo-Vostro-5620:~$ ls -t
demo         other_file.txt.gz                       WebstormProjects
example.txt  bash-guide                              AndroidStudioProjects
number.txt   greet.sh                                Android
actor.csv    Downloads                               Pictures
file1.txt    Desktop                                 Music
script.sh    IdeaProjects                            Public
folder       SA_CS5                                  Templates
data.csv     google-chrome-stable_current_amd64.deb  Videos
Documents    snap

anngo@anngo-Vostro-5620:~$ rmdir demo

anngo@anngo-Vostro-5620:~$ ls -t
example.txt        IdeaProjects
number.txt         SA_CS5
actor.csv          google-chrome-stable_current_amd64.deb
file1.txt          snap
script.sh          WebstormProjects
folder             AndroidStudioProjects
data.csv           Android
Documents          Pictures
other_file.txt.gz  Music
bash-guide         Public
greet.sh           Templates
Downloads          Videos
Desktop

anngo@anngo-Vostro-5620:~$
```

## 5. System Info Operations

### 5.1. `date`
Shows the current date and time.
```bash
anngo@anngo-Vostro-5620:~$ date
Fri May  2 09:22:48 PM +07 2025

anngo@anngo-Vostro-5620:~$
```

### 5.2. `df`
Shows disk usage.
```bash
anngo@anngo-Vostro-5620:~$ df
Filesystem     1K-blocks      Used Available Use% Mounted on
tmpfs            1605200      2744   1602456   1% /run
/dev/nvme0n1p6 188198800  53097372 125518684  30% /
tmpfs            8025980     97540   7928440   2% /dev/shm
tmpfs               5120         8      5112   1% /run/lock
efivarfs             438       203       231  47% /sys/firmware/efi/efivars
/dev/nvme0n1p1     98304     73543     24761  75% /boot/efi
/dev/nvme0n1p4  27546620    837796  26708824   4% /media/anngo/E
/dev/nvme0n1p5  64547836  20825944  43721892  33% /media/anngo/F
/dev/nvme0n1p3 215945212 106920324 109024888  50% /media/anngo/Windows
tmpfs            1605196       168   1605028   1% /run/user/1000

anngo@anngo-Vostro-5620:~$
```

### 5.3. `whoami`
Return current logged in username.
```bash
anngo@anngo-Vostro-5620:~$ whoami
anngo

anngo@anngo-Vostro-5620:~$
```

### 5.4. `man`
Shows the manual for specified command.  
```bash
anngo@anngo-Vostro-5620:~$ man ls
```

### 5.5. `top`
Displays your currently active processes.
```bash
anngo@anngo-Vostro-5620:~$ top
```

### 5.6. `ps`
The `ps` command is used to list the processes that are currently running on your system. It can show you information about active processes, such as their IDs, the user who started them, and the command that initiated them.
```bash
ps [options]
```
- `ps -e` or `ps -A`: Lists all processes currently running on the system (equivalent to ps -ef but without the full details).
- `ps -f`: Shows a full listing of process details, including PID, PPID, the TTY, time, and the command.
- `ps -aux`: Lists all processes for all users with full details. This is often used in combination with grep to filter processes.
- `ps -u <user>`: Displays processes belonging to a specific user.

Example:
```bash
anngo@anngo-Vostro-5620:~$ ps -ef
UID          PID    PPID  C STIME TTY          TIME CMD
root           1       0  0 21:33 ?        00:00:02 /sbin/init splash
root           2       0  0 21:33 ?        00:00:00 [kthreadd]
root           3       2  0 21:33 ?        00:00:00 [pool_workqueue_release]
root           4       2  0 21:33 ?        00:00:00 [kworker/R-rcu_gp]
root           5       2  0 21:33 ?        00:00:00 [kworker/R-sync_wq]
root           6       2  0 21:33 ?        00:00:00 [kworker/R-slub_flushwq]
root           7       2  0 21:33 ?        00:00:00 [kworker/R-netns]
...
```

- `UID`: The user ID (UID) of the user who owns the process.
- `PID`: The Process ID (PID) is a unique identifier for the process.
- `PPID`: The Parent Process ID (PPID) is the process ID of the parent process that spawned this process.
- `C`: The CPU usage percentage of the process (how much CPU the process is using).
- `STIME`: The start time of the process (the time when the process started).
- `TTY`: The terminal type or device associated with the process. If it’s a ?, it means the process is not attached to any terminal.
- `TIME`: The total CPU time the process has consumed since it started.
- `CMD`: The command that started the process or the name of the program.

Example:
```bash
UID   PID  PPID  C STIME TTY      TIME CMD
root    1    0   0 21:33 ?        00:00:02 /sbin/init splash
root    2    0   0 21:33 ?        00:00:00 [kthreadd]
```
- `UID`: The process is owned by the user `root`.
- `PID`: Each process has a unique `PID`, for example `1`.
- `PPID`: The parent process `ID` for `PID 1` is `0` (no parent process).
- `C`: The process is not using any CPU (`0` means no CPU usage).
- `STIME`: The process started at `21:33`.
- `TTY`: No terminal associated with the process, marked by `?`.
- `TIME`: The process has used `00:00:02` of CPU time.
- `CMD`: The command that started the process is `/sbin/init splash`.


### 5.7. `uname`
Shows kernel information.  
```bash
uname [options]
```

Example:
```bash
anngo@anngo-Vostro-5620:~$ uname -a
Linux anngo-Vostro-5620 6.11.0-24-generic #24~24.04.1-Ubuntu SMP PREEMPT_DYNAMIC Tue Mar 25 20:14:34 UTC 2 x86_64 x86_64 x86_64 GNU/Linux

anngo@anngo-Vostro-5620:~$
```

### 5.8. `du`
Shows the disk usage of files or directories. For more information on this command check this [link](http://www.linfo.org/du.html)
```bash
du [option] [filename|directory]
```
Options:
- `-h` (human readable) Displays output it in kilobytes (K), megabytes (M) and gigabytes (G).
- `-s` (supress or summarize) Outputs total disk space of a directory and supresses reports for subdirectories. 

Example:
```bash
anngo@anngo-Vostro-5620:~$ du -h Documents/
4.0K	Documents/Typescript-tutorial/.git/branches
68K	Documents/Typescript-tutorial/.git/hooks
8.0K	Documents/Typescript-tutorial/.git/info
8.0K	Documents/Typescript-tutorial/.git/refs/heads
4.0K	Documents/Typescript-tutorial/.git/refs/tags
12K	Documents/Typescript-tutorial/.git/refs/remotes/origin
16K	Documents/Typescript-tutorial/.git/refs/remotes
32K	Documents/Typescript-tutorial/.git/refs
...
```

### 5.9. `free`
Displays the amount of free and used memory in the system, including swap space.
```bash
anngo@anngo-Vostro-5620:~$ free -h
               total        used        free      shared  buff/cache   available
Mem:            15Gi       4.9Gi       8.4Gi       1.1Gi       3.5Gi        10Gi
Swap:          4.0Gi          0B       4.0Gi

anngo@anngo-Vostro-5620:~$
```

### 5.10. `lscpu`
Shows information about the CPU architecture, such as the number of CPUs, cores, threads, and CPU model.

```bash
anngo@anngo-Vostro-5620:~$ lscpu
Architecture:             x86_64
  CPU op-mode(s):         32-bit, 64-bit
  Address sizes:          39 bits physical, 48 bits virtual
  Byte Order:             Little Endian
CPU(s):                   16
  On-line CPU(s) list:    0-15
Vendor ID:                GenuineIntel
  Model name:             12th Gen Intel(R) Core(TM) i5-1240P
    CPU family:           6
    Model:                154
    Thread(s) per core:   2
    Core(s) per socket:   12
    Socket(s):            1
    Stepping:             3
    CPU(s) scaling MHz:   24%
    CPU max MHz:          4400.0000
    CPU min MHz:          400.0000
    BogoMIPS:             4224.00
    Flags:                fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc ar
                          t arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 
                          xtpr pdcm sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp ibrs_enhance
                          d tpr_shadow flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt clwb intel_pt sha_ni xsaveopt xsavec xgetb
                          v1 xsaves split_lock_detect user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni vaes 
                          vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr ibt flush_l1d arch_capabilities
Virtualization features:  
  Virtualization:         VT-x
Caches (sum of all):      
  L1d:                    448 KiB (12 instances)
  L1i:                    640 KiB (12 instances)
  L2:                     9 MiB (6 instances)
  L3:                     12 MiB (1 instance)
NUMA:                     
  NUMA node(s):           1
  NUMA node0 CPU(s):      0-15
Vulnerabilities:          
  Gather data sampling:   Not affected
  Itlb multihit:          Not affected
  L1tf:                   Not affected
  Mds:                    Not affected
  Meltdown:               Not affected
  Mmio stale data:        Not affected
  Reg file data sampling: Mitigation; Clear Register File
  Retbleed:               Not affected
  Spec rstack overflow:   Not affected
  Spec store bypass:      Mitigation; Speculative Store Bypass disabled via prctl
  Spectre v1:             Mitigation; usercopy/swapgs barriers and __user pointer sanitization
  Spectre v2:             Mitigation; Enhanced / Automatic IBRS; IBPB conditional; RSB filling; PBRSB-eIBRS SW sequence; BHI BHI_DIS_S
  Srbds:                  Not affected
  Tsx async abort:        Not affected

anngo@anngo-Vostro-5620:~$ 
```

### 5.11. `lsblk`
Lists information about all available block devices, such as hard drives, partitions, and their mount points.

```bash
anngo@anngo-Vostro-5620:~$ lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0         7:0    0   1.3G  1 loop /snap/android-studio/189
loop1         7:1    0   1.3G  1 loop /snap/android-studio/187
loop2         7:2    0     4K  1 loop /snap/bare/5
loop3         7:3    0  55.4M  1 loop /snap/core18/2846
loop4         7:4    0  55.4M  1 loop /snap/core18/2855
loop5         7:5    0  63.7M  1 loop /snap/core20/2496
loop6         7:6    0  63.8M  1 loop /snap/core20/2501
loop7         7:7    0  73.9M  1 loop /snap/core22/1963
loop8         7:8    0  73.9M  1 loop /snap/core22/1908
loop9         7:9    0  66.2M  1 loop /snap/core24/739
loop10        7:10   0  66.8M  1 loop /snap/core24/888
...
```

### 5.12. `hostnamectl`
Displays and allows you to set the system's hostname, which is the name that identifies the machine on a network.
```bash
anngo@anngo-Vostro-5620:~$ hostnamectl
 Static hostname: anngo-Vostro-5620
       Icon name: computer-laptop
         Chassis: laptop 💻
      Machine ID: 83a58e516c774783b546ad0e191eed66
         Boot ID: 079419262fd14a49aff3ce98767a92c4
Operating System: Ubuntu 24.04.1 LTS              
          Kernel: Linux 6.11.0-24-generic
    Architecture: x86-64
 Hardware Vendor: Dell Inc.
  Hardware Model: Vostro 5620
Firmware Version: 1.25.0
   Firmware Date: Thu 2024-09-12
    Firmware Age: 7month 2w 5d

anngo@anngo-Vostro-5620:~$
```

### 5.13 `lspci`
Lists all PCI devices (e.g., graphics cards, network cards) connected to the system.
```bash
anngo@anngo-Vostro-5620:~$ lspci
0000:00:00.0 Host bridge: Intel Corporation Device 4621 (rev 02)
0000:00:02.0 VGA compatible controller: Intel Corporation Alder Lake-P GT2 [Iris Xe Graphics] (rev 0c)
0000:00:04.0 Signal processing controller: Intel Corporation Alder Lake Innovation Platform Framework Processor Participant (rev 02)
0000:00:06.0 System peripheral: Intel Corporation RST VMD Managed Controller
0000:00:08.0 System peripheral: Intel Corporation 12th Gen Core Processor Gaussian & Neural Accelerator (rev 02)
0000:00:0d.0 USB controller: Intel Corporation Alder Lake-P Thunderbolt 4 USB Controller (rev 02)
0000:00:0e.0 RAID bus controller: Intel Corporation Volume Management Device NVMe RAID Controller
0000:00:12.0 Serial controller: Intel Corporation Alder Lake-P Integrated Sensor Hub (rev 01)
0000:00:14.0 USB controller: Intel Corporation Alder Lake PCH USB 3.2 xHCI Host Controller (rev 01)
0000:00:14.2 RAM memory: Intel Corporation Alder Lake PCH Shared SRAM (rev 01)
0000:00:14.3 Network controller: Intel Corporation Alder Lake-P PCH CNVi WiFi (rev 01)
0000:00:15.0 Serial bus controller: Intel Corporation Alder Lake PCH Serial IO I2C Controller #0 (rev 01)
0000:00:15.1 Serial bus controller: Intel Corporation Alder Lake PCH Serial IO I2C Controller #1 (rev 01)
0000:00:16.0 Communication controller: Intel Corporation Alder Lake PCH HECI Controller (rev 01)
0000:00:1d.0 PCI bridge: Intel Corporation Alder Lake PCI Express Root Port #9 (rev 01)
0000:00:1f.0 ISA bridge: Intel Corporation Alder Lake PCH eSPI Controller (rev 01)
0000:00:1f.3 Audio device: Intel Corporation Alder Lake PCH-P High Definition Audio Controller (rev 01)
0000:00:1f.4 SMBus: Intel Corporation Alder Lake PCH-P SMBus Host Controller (rev 01)
0000:00:1f.5 Serial bus controller: Intel Corporation Alder Lake-P PCH SPI Controller (rev 01)
0000:01:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 15)
10000:e0:06.0 PCI bridge: Intel Corporation 12th Gen Core Processor PCI Express x4 Controller #0 (rev 02)
10000:e1:00.0 Non-Volatile memory controller: SK hynix Gold P31/BC711/PC711 NVMe Solid State Drive

anngo@anngo-Vostro-5620:~$ 
```

### 5.14. `uptime`
Shows how long the system has been running, along with the current time, load averages, and number of users.

```bash
anngo@anngo-Vostro-5620:~$ uptime
 23:03:55 up  1:30,  1 user,  load average: 1.56, 1.45, 1.04

anngo@anngo-Vostro-5620:~$ 
```

### 5.15. `lsusb`
Lists all USB devices connected to the system.

```bash
anngo@anngo-Vostro-5620:~$ lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 002: ID 0c45:6a1b Microdia Integrated_Webcam_FHD
Bus 003 Device 003: ID 8087:0026 Intel Corp. AX201 Bluetooth
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub

anngo@anngo-Vostro-5620:~$
```

### 5.16. `who`
Shows who is currently logged into the system.
```bash
anngo@anngo-Vostro-5620:~$ who
anngo    seat0        2025-05-02 21:33 (login screen)
anngo    tty2         2025-05-02 21:33 (tty2)

anngo@anngo-Vostro-5620:~$
```

### 5.17. `w`
Displays information about the users currently logged in, along with their processes and system load.

```bash
anngo@anngo-Vostro-5620:~$ w
 23:02:28 up  1:29,  1 user,  load average: 1.94, 1.53, 1.02
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
anngo    tty2     -                21:33    1:29m  0.04s  0.04s /usr/libexec/gnome-session-binary --session=ubuntu

anngo@anngo-Vostro-5620:~$
```

### 5.18 .`systemctl`
Used to control the systemd system and service manager. It can manage services, such as starting, stopping, or restarting services, as well as viewing their status.
```bash
anngo@anngo-Vostro-5620:~$ sudo systemctl status elasticsearch
[sudo] password for anngo: 
○ elasticsearch.service - Elasticsearch
     Loaded: loaded (/usr/lib/systemd/system/elasticsearch.service; enabled; preset: enabled)
     Active: inactive (dead) since Fri 2025-05-02 22:08:27 +07; 1h 1min ago
   Duration: 34min 44.375s
       Docs: https://www.elastic.co
    Process: 2387 ExecStart=/usr/share/elasticsearch/bin/systemd-entrypoint -p ${PID_DIR}/elasticsearch.pid --quiet (code=exited, status=143)
   Main PID: 2387 (code=exited, status=143)
        CPU: 1min 45.865s

May 02 21:33:24 anngo-Vostro-5620 systemd[1]: Starting elasticsearch.service - Elasticsearch...
May 02 21:33:42 anngo-Vostro-5620 systemd[1]: Started elasticsearch.service - Elasticsearch.
May 02 22:08:26 anngo-Vostro-5620 systemd[1]: Stopping elasticsearch.service - Elasticsearch...
May 02 22:08:27 anngo-Vostro-5620 systemd[1]: elasticsearch.service: Deactivated successfully.
May 02 22:08:27 anngo-Vostro-5620 systemd[1]: Stopped elasticsearch.service - Elasticsearch.
May 02 22:08:27 anngo-Vostro-5620 systemd[1]: elasticsearch.service: Consumed 1min 45.865s CPU time.

anngo@anngo-Vostro-5620:~$ sudo systemctl stop elasticsearch

anngo@anngo-Vostro-5620:~$ sudo systemctl start elasticsearch

anngo@anngo-Vostro-5620:~$
```

### 5.19. `w`
Displays who is online.
```bash
anngo@anngo-Vostro-5620:~$ w
 22:10:03 up 36 min,  1 user,  load average: 0.85, 0.92, 0.82
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
anngo    tty2     -                21:33   36:47   0.04s  0.04s /usr/libexec/gn

anngo@anngo-Vostro-5620:~$
```

### 5.20. `last`
Lists your last logins of specified user.  
```bash
last yourUsername
```

Example:
```bash
anngo@anngo-Vostro-5620:~$ last
anngo    tty2         tty2             Fri May  2 21:33   still logged in
anngo    seat0        login screen     Fri May  2 21:33   still logged in
reboot   system boot  6.11.0-24-generi Fri May  2 21:33   still running
anngo    tty2         tty2             Fri May  2 20:32 - 21:32  (01:00)
anngo    seat0        login screen     Fri May  2 20:32 - down   (01:00)
reboot   system boot  6.11.0-24-generi Fri May  2 20:31 - 21:32  (01:00)
anngo    tty2         tty2             Fri May  2 20:25 - 20:31  (00:06)
anngo    seat0        login screen     Fri May  2 20:25 - down   (00:06)
reboot   system boot  6.11.0-24-generi Fri May  2 20:23 - 20:31  (00:07)
...
```

### 5.21. `passwd`
Allows the current logged user to change their password.
```bash
anngo@anngo-Vostro-5620:~$ passwd
Changing password for anngo.
Current password:

```

## 6. Network Operations

### 6.1. `ping`
The `ping` command is used to test the network connection between your system and a specified host (e.g., a website or IP address). It sends packets to the target host and waits for a response, which helps in diagnosing network issues.
```bash
ping host
```

Example:
```bash
anngo@anngo-Vostro-5620:~$ ping google.com
PING google.com (2404:6800:4003:c05::66) 56 data bytes
64 bytes from sl-in-f102.1e100.net (2404:6800:4003:c05::66): icmp_seq=1 ttl=105 time=56.7 ms
64 bytes from sl-in-f102.1e100.net (2404:6800:4003:c05::66): icmp_seq=2 ttl=105 time=96.3 ms
64 bytes from sl-in-f102.1e100.net (2404:6800:4003:c05::66): icmp_seq=3 ttl=105 time=57.6 ms
64 bytes from sl-in-f102.1e100.net (2404:6800:4003:c05::66): icmp_seq=4 ttl=105 time=50.5 ms
64 bytes from sl-in-f102.1e100.net (2404:6800:4003:c05::66): icmp_seq=5 ttl=105 time=58.4 ms
64 bytes from sl-in-f102.1e100.net (2404:6800:4003:c05::66): icmp_seq=6 ttl=105 time=80.6 ms
64 bytes from sl-in-f102.1e100.net (2404:6800:4003:c05::66): icmp_seq=7 ttl=105 time=66.1 ms
...
```

### 6.2. `wget`
Downloads file.  
```bash
wget file
```

### 6.3. `curl`
`curl` is a command-line tool for requesting or sending data using URL syntax. Usefull on systems where you only have terminal available for making various requests.
```bash
curl url
```
Use  `-X` or `--request` to specify which method you would like invoke (GET, POST, DELETE, ...).
Use `-d <data>` or `--data <data>` to POST data on given URL.

Example:
```bash
anngo@anngo-Vostro-5620:~$ curl https://api.example.com/data

anngo@anngo-Vostro-5620:~$ curl -X POST -d "username=user&password=pass" https://api.example.com/login

anngo@anngo-Vostro-5620:~$ curl -H "Authorization: Bearer your_token" https://api.example.com/data

anngo@anngo-Vostro-5620:~$ curl -X POST -H "Content-Type: application/json" -d '{"username": "user", "password": "pass"}' https://api.example.com/login

anngo@anngo-Vostro-5620:~$ curl -X DELETE https://api.example.com/delete-item/123
```


## 7. Process Monitoring Operations

<table>
   <tr>
      <td><a href="#a-kill">kill</a></td>
      <td><a href="#b-killall">killall</a></td>
      <td><a href="#c-&">&amp;</a></td>
      <td><a href="#d-nohup">nohup</a></td>
   </tr>
</table>

### 7.1. `kill`
The kill command is used to terminate a process by sending it a signal. By default, it sends the SIGTERM signal (signal number 15), which asks a process to terminate gracefully. You can also send other signals like SIGKILL (9) to forcefully stop it.

```bash
anngo@anngo-Vostro-5620:~$ ps aux | grep firefox
anngo     12345  0.5  5.2 123456 65432 ?  Sl   10:00   0:15 /usr/lib/firefox/firefox

anngo@anngo-Vostro-5620:~$ kill 12345

anngo@anngo-Vostro-5620:~$ kill -9 12345
```

### 7.2. `killall`
The killall command is used to terminate all processes with a given name. Unlike kill, which requires a process ID (PID), killall targets all processes that match the name you specify.

```bash
anngo@anngo-Vostro-5620:~$ killall firefox

anngo@anngo-Vostro-5620:~$ killall -9 firefox
```

# 2. Basic Shell Programming


The first line that you will write in bash script files is called `shebang`. This line in any script determines the script's ability to be executed like a standalone executable without typing sh, bash, python, php etc beforehand in the terminal.

```bash
#!/usr/bin/env bash
```

## 2.1. Variables

Creating variables in bash is similar to other languages. There are no data types. A variable in bash can contain a number, a character, a string of characters, etc. You have no need to declare a variable, just assigning a value to its reference will create it.

Example:
```bash
str="hello world"
```

The above line creates a variable `str` and assigns "hello world" to it. The value of variable is retrieved by putting the `$` in the beginning of variable name.

Example:
```bash
echo $str   # hello world
```
## 2.2. Array
Like other languages bash has also arrays. An array is a variable containing multiple values. There's no maximum limit on the size of array. Arrays in bash are zero based. The first element is indexed with element 0. There are several ways for creating arrays in bash which are given below.

Examples:
```bash
array[0]=val
array[1]=val
array[2]=val
array=([2]=val [0]=val [1]=val)
array=(val val val)
```
To display a value at specific index use following syntax:

```bash
${array[i]}     # where i is the index
```

If no index is supplied, array element 0 is assumed. To find out how many values there are in the array use the following syntax:

```bash
${#array[@]}
```

Bash has also support for the ternary conditions. Check some examples below.

```bash
${varname:-word}    # if varname exists and isn't null, return its value; otherwise return word
${varname:=word}    # if varname exists and isn't null, return its value; otherwise set it word and then return its value
${varname:+word}    # if varname exists and isn't null, return word; otherwise return null
${varname:offset:length}    # performs substring expansion. It returns the substring of $varname starting at offset and up to length characters
```

## 2.3 String Substitution

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

## 2.4. Other String Tricks

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

## 2.5. Functions
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

## 2.6. Conditionals

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

## 2.7. Loops

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

# 2.8. Regex

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
## 2.9. Pipes

Multiple commands can be linked together with a pipe, `|`. A `|` will send the standard-output from command A to the standard-input of command B.
Pipes can also be constructed with the `|&` symbols. This will send the standard-output **and** standard-error from command A to the standard-input of command B.

# 3. Tricks

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

# 4. Debugging
You can easily debug the bash script by passing different options to `bash` command. For example `-n` will not run commands and check for syntax errors only. `-v` echo commands before running them. `-x` echo commands after command-line processing.

```bash
bash -n scriptname
bash -v scriptname
bash -x scriptname
```

# 5. Multi-threading
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
