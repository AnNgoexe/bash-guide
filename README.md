<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/2059754/24601246/753a7f36-1858-11e7-9d6b-7a0e64fb27f7.png" alt="bash logo"/>
</p>

# Table of Contents
  1. [Basic Operations](#1-basic-operations)  
  2. [File Operations](#2-file-operations)  
  3. [Text Operations](#3-text-operations)  
    1.3. [Directory Operations](#13-directory-operations)  
    1.4. [SSH, System Info & Network Operations](#14-ssh-system-info--network-operations)  
    1.5. [Process Monitoring Operations](#15-process-monitoring-operations)
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

### 1.5. clear
Clears content on window.

## 2. File Operations
<table>
   <tr>
      <td><a href="#a-cat">cat</a></td>
      <td><a href="#b-chmod">chmod</a></td>
      <td><a href="#c-chown">chown</a></td>
      <td><a href="#d-cp">cp</a></td>
      <td><a href="#e-diff">diff</a></td>
      <td><a href="#f-file">file</a></td>
      <td><a href="#g-find">find</a></td>
      <td><a href="#h-gunzip">gunzip</a></td>
      <td><a href="#i-gzcat">gzcat</a></td>
      <td><a href="#j-gzip">gzip</a></td>
      <td><a href="#k-head">head</a></td>
   </tr>
   <tr>
      <td><a href="#l-less">less</a></td>
      <td><a href="#m-lpq">lpq</a></td>
      <td><a href="#n-lpr">lpr</a></td>
      <td><a href="#o-lprm">lprm</a></td>
      <td><a href="#p-ls">ls</a></td>
      <td><a href="#q-more">more</a></td>
      <td><a href="#r-mv">mv</a></td>
      <td><a href="#s-rm">rm</a></td>
      <td><a href="#t-tail">tail</a></td>
      <td><a href="#u-touch">touch</a></td>
   </tr>
</table>

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

<table>
    <tr>
      <td><a href="#a-awk">awk</a></td>
      <td><a href="#b-cut">cut</a></td>
      <td><a href="#c-echo">echo</a></td>
      <td><a href="#d-egrep">egrep</a></td>
      <td><a href="#e-fgrep">fgrep</a></td>
      <td><a href="#f-fmt">fmt</a></td>
      <td><a href="#g-grep">grep</a></td>
      <td><a href="#h-nl">nl</a></td>
      <td><a href="#i-sed">sed</a></td>
      <td><a href="#j-sort">sort</a></td>
   </tr>
   <tr>
      <td><a href="#k-tr">tr</a></td>
      <td><a href="#l-uniq">uniq</a></td>
      <td><a href="#m-wc">wc</a></td>
   </tr>
</table>

### a. `awk`
awk is the most useful command for handling text files. It operates on an entire file line by line. By default it uses whitespace to separate the fields. The most common syntax for awk command is

```bash
awk '/search_pattern/ { action_to_take_if_pattern_matches; }' file_to_parse
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
awk -F':' '{ print $1 }' /etc/passwd
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


### b. `cut`
Remove sections from each line of files

*example.txt*
```bash
red riding hood went to the park to play
```

*show me columns 2 , 7 , and 9 with a space as a separator*
```bash
cut -d " " -f2,7,9 example.txt
```
```bash
riding park play
```

### c. `echo`
Display a line of text

*display "Hello World"*
```bash
echo Hello World
```
```bash
Hello World
```

*display "Hello World" with newlines between words*
```bash
echo -ne "Hello\nWorld\n"
```
```bash
Hello
World
```

### d. `egrep`
Print lines matching a pattern - Extended Expression (alias for: 'grep -E')

*example.txt*
```bash
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
```

*display lines that have either "Lorem" or "dolor" in them.*
```bash
egrep '(Lorem|dolor)' example.txt
or
grep -E '(Lorem|dolor)' example.txt
```
```bash
Lorem ipsum
dolor sit amet,
et dolore magna
duo dolores et ea
sanctus est Lorem
ipsum dolor sit
```

### e. `fgrep`
Print lines matching a pattern - FIXED pattern matching  (alias for: 'grep -F')

*example.txt*
```bash
Lorem ipsum
dolor sit amet,
consetetur
sadipscing elitr,
sed diam nonumy
eirmod tempor
foo (Lorem|dolor) 
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
```

*Find the exact string '(Lorem|dolor)' in example.txt*
```bash
fgrep '(Lorem|dolor)' example.txt
or
grep -F '(Lorem|dolor)' example.txt
```
```bash
foo (Lorem|dolor) 
```

### f. `fmt`
Simple optimal text formatter

*example: example.txt (1 line)*
```bash
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
```

*output the lines of example.txt to 20 character width*
```bash
cat example.txt | fmt -w 20
```
```bash
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
```

### g. `grep`
Looks for text inside files. You can use grep to search for lines of text that match one or many regular expressions, and outputs only the matching lines.  
```bash
grep pattern filename
```
Example:
```bash
$ grep admin /etc/passwd
_kadmin_admin:*:218:-2:Kerberos Admin Service:/var/empty:/usr/bin/false
_kadmin_changepw:*:219:-2:Kerberos Change Password Service:/var/empty:/usr/bin/false
_krb_kadmin:*:231:-2:Open Directory Kerberos Admin Service:/var/empty:/usr/bin/false
```
You can also force grep to ignore word case by using `-i` option. `-r` can be used to search all files under the specified directory, for example:
```bash
$ grep -r admin /etc/
```
And `-w` to search for words only. For more detail on `grep`, check following [link](https://www.cyberciti.biz/faq/grep-in-bash).

### h. `nl`
Number lines of files

*example.txt*
```bash
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
```

*show example.txt with line numbers*
```bash
nl -s". " example.txt 
```
```bash
     1. Lorem ipsum
     2. dolor sit amet,
     3. consetetur
     4. sadipscing elitr,
     5. sed diam nonumy
     6. eirmod tempor
     7. invidunt ut labore
     8. et dolore magna
     9. aliquyam erat, sed
    10. diam voluptua. At
    11. vero eos et
    12. accusam et justo
    13. duo dolores et ea
    14. rebum. Stet clita
    15. kasd gubergren,
    16. no sea takimata
    17. sanctus est Lorem
    18. ipsum dolor sit
    19. amet.
```

### i. `sed`
Stream editor for filtering and transforming text

*example.txt*
```bash
Hello This is a Test 1 2 3 4
``` 

*replace all spaces with hyphens*
```bash
sed 's/ /-/g' example.txt
```
```bash
Hello-This-is-a-Test-1-2-3-4
```

*replace all digits with "d"*
```bash
sed 's/[0-9]/d/g' example.txt
```
```bash
Hello This is a Test d d d d
```

### j. `sort`
Sort lines of text files

*example.txt*
```bash
f
b
c
g
a
e
d
```

*sort example.txt*
```bash
sort example.txt
```
```bash
a
b
c
d
e
f
g
```

*randomize a sorted example.txt*
```bash
sort example.txt | sort -R
```
```bash
b
f
a
c
d
g
e
```

### k. `tr`
Translate or delete characters

*example.txt*
```bash
Hello World Foo Bar Baz!
```

*take all lower case letters and make them upper case*
```bash
cat example.txt | tr 'a-z' 'A-Z' 
```
```bash
HELLO WORLD FOO BAR BAZ!
```

*take all spaces and make them into newlines*
```bash
cat example.txt | tr ' ' '\n'
```
```bash
Hello
World
Foo
Bar
Baz!
```

### l. `uniq`
Report or omit repeated lines

*example.txt*
```bash
a
a
b
a
b
c
d
c
```

*show only unique lines of example.txt (first you need to sort it, otherwise it won't see the overlap)*
```bash
sort example.txt | uniq
```
```bash
a
b
c
d
```

*show the unique items for each line, and tell me how many instances it found*
```bash
sort example.txt | uniq -c
```
```bash
    3 a
    2 b
    2 c
    1 d
```

### m. `wc`
Tells you how many lines, words and characters there are in a file.  
```bash
wc filename
```
Example:
```bash
$ wc demo.txt
7459   15915  398400 demo.txt
```
Where `7459` is lines, `15915` is words and `398400` is characters.

## 1.3. Directory Operations

<table>
   <tr>
      <td><a href="#a-cd">cd</a></td>
      <td><a href="#b-mkdir">mkdir</a></td>
      <td><a href="#c-pwd">pwd</a></td>
   </tr>
</table>

### a. `cd`
Moves you from one directory to other. Running this  
```bash
$ cd
```
moves you to home directory. This command accepts an optional `dirname`, which moves you to that directory.
```bash
cd dirname
```
Switch to the previous working directory
```bash
cd -
```

### b. `mkdir`
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

### c. `pwd`
Tells you which directory you currently are in.  
```bash
pwd
```

## 1.4. SSH, System Info & Network Operations

<table>
   <tr>
      <td><a href="#a-bg">bg</a></td>
      <td><a href="#b-cal">cal</a></td>
      <td><a href="#c-date">date</a></td>
      <td><a href="#d-df">df</a></td>
      <td><a href="#e-dig">dig</a></td>
      <td><a href="#f-du">du</a></td>
      <td><a href="#g-fg">fg</a></td>
      <td><a href="#h-finger">finger</a></td>   
      <td><a href="#i-jobs">jobs</a></td>
      <td><a href="#j-last">last</a></td>
   </tr>
   <tr>
      <td><a href="#k-man">man</a></td>
      <td><a href="#l-passwd">passwd</a></td>
      <td><a href="#m-ping">ping</a></td>
      <td><a href="#n-ps">ps</a></td>
      <td><a href="#o-quota">quota</a></td>
      <td><a href="#p-scp">scp</a></td>
      <td><a href="#q-ssh">ssh</a></td>
      <td><a href="#r-top">top</a></td>
      <td><a href="#s-uname">uname</a></td>
      <td><a href="#t-uptime">uptime</a></td>
   </tr>
   <tr>
      <td><a href="#u-w">w</a></td>
      <td><a href="#v-wget">wget</a></td>
      <td><a href="#w-whoami">whoami</a></td>
      <td><a href="#x-whois">whois</a></td>
      <td><a href="#y-rsync">sync</a></td>
      <td><a href="#z-curl">curl</a></td>
   </tr>
</table>

### a. `bg`
Lists stopped or background jobs; resume a stopped job in the background.

### b. `cal`
Shows the month's calendar.

### c. `date`
Shows the current date and time.

### d. `df`
Shows disk usage.

### e. `dig`
Gets DNS information for domain.  
```bash
dig domain
```

### f. `du`
Shows the disk usage of files or directories. For more information on this command check this [link](http://www.linfo.org/du.html)
```bash
du [option] [filename|directory]
```
Options:
- `-h` (human readable) Displays output it in kilobytes (K), megabytes (M) and gigabytes (G).
- `-s` (supress or summarize) Outputs total disk space of a directory and supresses reports for subdirectories. 

Example:
```bash
du -sh pictures
1.4M pictures
```

### g. `fg`
Brings the most recent job in the foreground.

### h. `finger`
Displays information about user.  
```bash
finger username
```
### i. `jobs`
Lists the jobs running in the background, giving the job number.

### j. `last`
Lists your last logins of specified user.  
```bash
last yourUsername
```

### k. `man`
Shows the manual for specified command.  
```bash
man command
```

### l. `passwd`
Allows the current logged user to change their password.

### m. `ping`
Pings host and outputs results.  
```bash
ping host
```

### n. `ps`
Lists your processes.  
```bash
ps -u yourusername
```
Use the flags ef. e for every process and f for full listing. 
```bash
ps -ef
```

### o. `quota`
Shows what your disk quota is.  
```bash
quota -v
```

### p. `scp`
Transfer files between a local host and a remote host or between two remote hosts.

*copy from local host to remote host*
```bash
scp source_file user@host:directory/target_file
```
*copy from remote host to local host*
```bash
scp user@host:directory/source_file target_file
scp -r user@host:directory/source_folder target_folder
```
This command also accepts an option `-P` that can be used to connect to specific port.  
```bash
scp -P port user@host:directory/source_file target_file
```

### q. `ssh`
ssh (SSH client) is a program for logging into and executing commands on a remote machine.  
```bash
ssh user@host
```
This command also accepts an option `-p` that can be used to connect to specific port.  
```bash
ssh -p port user@host
```

### r. `top`
Displays your currently active processes.

### s. `uname`
Shows kernel information.  
```bash
uname -a
```

### t. `uptime`
Shows current uptime.

### u. `w`
Displays who is online.

### v. `wget`
Downloads file.  
```bash
wget file
```

### w. `whoami`
Return current logged in username.

### x. `whois`
Gets whois information for domain.  
```bash
whois domain
```

### y. `rsync`
Does the same job as `scp` command, but transfers only changed files. Useful when transferring the same folder to/from server multiple times.
```bash
rsync source_folder user@host:target_folder
rsync user@host:target_folder target_folder
```

### z. `curl`
Curl is a command-line tool for requesting or sending data using URL syntax. Usefull on systems where you only have terminal available for making various requests.
```bash
curl url
```
Use  `-X` or `--request` to specify which method you would like invoke (GET, POST, DELETE, ...).
Use `-d <data>` or `--data <data>` to POST data on given URL.

## 1.5. Process Monitoring Operations

<table>
   <tr>
      <td><a href="#a-kill">kill</a></td>
      <td><a href="#b-killall">killall</a></td>
      <td><a href="#c-&">&amp;</a></td>
      <td><a href="#d-nohup">nohup</a></td>
   </tr>
</table>

### a. `kill`
Kills (ends) the processes with the ID you gave.  
```bash
kill PID
```

### b. `killall`
Kill all processes with the name.  
```bash
killall processname
```

### c. &
The `&` symbol instructs the command to run as a background process in a subshell.
```bash
command &
```

### d. `nohup`
nohup stands for "No Hang Up". This allows to run command/process or shell script that can continue running in the background after you log out from a shell.
```bash
nohup command
```
Combine it with `&` to create background processes 
```bash
nohup command &
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
