# This file contains homework questions for the lecture on 
# Control Structures and Functions.  Questions appear as comments 
# in the file.  Place your answers as executable code immediately 
# following the relevant question.


# QUESTION 1: Assign the value 3 to a variable "x" and write
# a conditional statement that test whether x is less than 5.  
# if it is, print "Yay!" to screen.
# Assign 3 to x 
x <- 3
# Conditional statement and print
if (x < 5){
    print ("Yay!")
}


# QUESTION 2:  Create two variables "x" and "y" and assign 
# each a numeric value. Create a conditional statement that 
# tests whether the value of a variable "x" is equivalent 
# to the value of variable "y." If the values are equivalent, 
# print "The variables are equal" to screen. If they are not 
# equivalent, print "The variables are not equal" to screen.
# Assign values to x and y
X <- 2
y <- 5
# Check if x eq y else not eq
if (x == y){
    print("The variables are equal")
} else {
    print("The variables are not equal")
}

# QUESTION 3:  Duplicate the conditional code from above, but 
# change the logic of the conditional so that it tests for 
# conditions in which "x" IS NOT EQUIVALENT" to "y" and print 
# the appropriate message to screen accordingly.
# Checking if x is not equal to y
if (x != y){
    print("x IS NOT EQUIVALENT to y")
}


# QUESTION 4:  Assign the boolean value TRUE to the variable "x", 
# and then create a conditional statement that tests whether the 
# value of a variable "x" is TRUE or FALSE. If the value is true, 
# print "X is true" to screen. If false print "X is false" to screen.

# Assign TRUE to the variable x
x <- TRUE

# Conditional statement to test the value of variable x
if (x == TRUE) {
  print("X is true")
} else {
  print("X is false")
}


# QUESTION 5: Write a "for" loop that iterates through the 
# values 1 to 10 and prints the iteration number to screen 
# during each loop.
# for loop from 1 to 10
for (i in 1:10) {
  print(i)
}


# Question 6: Assume that you want to create a loop that executes 
# exactly 10 times. Assign the value 1 to "x" and then write a "while" 
# loop that iterates based on a test of the value of "x" and for each 
# loop prints the value of "x" to the screen. 
#
# The printed output should look like:
#
# 1 2 3 4 5 6 7 8 9 10
#
# Note that depending on your browser the numbers may print to the same 
# line or each on a new line.

# Assign 1 to x
x <- 1

# While loop to iterate 10 times and print to the screen
while (x <= 10) {
  cat(x, " ")
  x <- x + 1
}

# Question 7: Create a list or vector object that contains 
# the following values:
#
# Tesla, Nissan, Harley, Chevy, Indian, MG. 
# 
# Then write code that loops through each item in the list and
# prints the value to screen

# Create a vector with the specified values
brands <- c("Tesla", "Nissan", "Harley", "Chevy", "Indian", "MG")

# Loop through each item in the vector and print the value to the screen
for (i in brands) {
  print(i)
}


# Question 8: Write code that loops through each item in the list 
# object that you created for Question 3 above and, for each value,
# if the values is "Harley" or "Indian" print, "This is a motorcycle" 
# to screen. Otherwise print, "This is a car" to screen.
# Loop through each item in the vector
for (i in brands) {
  if (i %in% c("Harley", "Indian")) {
    print("This is a motorcycle")
  } else {
    print("This is a car")
  }
}


# Question 9: Assign the values 1-10 to a vector.  Then, loop through
# your vector and print each value to screen unless the value is 5.  (The
# final output of your process should be: 1 2 3 4 6 7 8 9 10)
# Assign values 1-10 to mvector
mvector <- 1:10

# Loop through the vector and print each value unless it's 5
for (i in mvector) {
  if (i != 5) {
    cat(i, " ")
  }
}


# QUESTION 10: Write a function that performs a simple math equation 
# with a variable. Run the function substituting the variable with 
# at least three different values by calling it in a loop. For 
# instance, if you write a function for a variable "x", Use a loop 
# call the function for at least three numbers as "x".
# Define math equation
math_equation <- function(x) {
  result <- 1 + 3 * x - 4
  return(result)
}
# Loop the function for x
for (i in c(1, 12, 20)) {
  result <- math_equation(i)
  cat("x =", i, ", the result for the equation is:", result, "\n")
}
