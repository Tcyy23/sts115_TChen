---
output:
  pdf_document: default
  html_document: default
---
Week 1: The Command Line and Git
================================

Before doing the following, unzip `hw01_cmd-line-git.zip` and put the unzipped 
directory in your Home directory. Open a command line window and navigate to the 
unzipped directory with `cd ~/hw01_cmd-line-git`.

Steps
-----

1. From the root directory, navigate to the lowest-level subdirectory in the 
tree. Move `1.txt` up to the root of the directory
    + Required commands: `cd, mv`
    + **Hint:** if you have forgotten how many levels away you are from the root of 
    the directory, typing `pwd` will show you your location. Another helpful 
    command is `ls`

2. Navigate to `level_2a` and remove `extra_file.txt`. Then, copy the other 
file, `2.txt`, to the root of the directory
    + Required commands: `cd, cp, rm`
    + **Hint:** if you start feeling lost in the subdirectories, you can return to 
    the root directory and get your bearings with `cd ~/hw01_cmd-line-git`
    
3. Navigate up one directory and rename `wrong_name.txt` to `3.txt`. Move `3.txt` 
to the root of the directory. Navigate to the root of the directory
    + Required commands: `cd, mv`
    + **Hint:** to rename a file, you use the same command that moves files 
    between directories
    
4. Using Vim, create a new file titled `4.txt` in the root directory
    + Required commands: `vi` (or `vim`)
    
5. In `4.txt`, press Enter/Return. On a second line, type the following (do not 
include the quotation marks): "::::FINISHED!::::"

6. Save `4.txt` and exit from Vim. There should now be four `.txt` files in the 
root directory. Use `ls` to make sure. Print all these files to the terminal 
window with `cat *.txt`

7. Export the output from `cat *.txt` to a new file, titled `hw01_completed.txt`. 
You can do so by typing `cat *.txt > hw01_completed.txt`

8. Move `hw01_completed.txt` to a Git-initialized folder (you can use your 
finder or the command line to do this). Stage this file for a commit
    + Required commands: `git add`
    + **Hint:** your Git-initialized folder is whichever folder you've chosen to 
    use for your Adventures in Data Science assignments
    
9. Commit your changes. Don't forget to add a commit message!
    + Required commands: `git commit`