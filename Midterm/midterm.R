################################################################
# This file contains questions for the midterm exam for        #
# IST008 Adventures in Data Science:  Social Science Edition,  #
# Quarter 1.  Winter Quarter, 2022.                            #
#                                                              #
# Questions appear as comments in the file.  Some questions    #
# require you to write computer code (R or Shell Script) as    #
# an answer and other questions ask you to provide text only   #
# explanations of computing and Data Science concepts.         #
# The phrase "[Text Answer]" appears immediately following     #
# each question that requires a tex only answer.               #
#                                                              #
# This is exam is designed to provide you with the chance      #
# to demonstrate your understanding of both the concepts       #
# and syntax of the methods deployed by Data Scientists.       #
# As such, even if you are unable to provide working code      #
# for questions that require you to code, we encourage you     #
# to provide pseudo code and/or a textual explanation of       #
# of your understanding of how one would approach the          #
# problem computationally, or even how the computer itself     #
# would approach the problem given you knowledge of how        #
# computers and programming languages work.                    #
#                                                              #
# Because problem solving is an essential part of being a      #
# Data Scientist, you are allowed to use any resources at      #
# your disposal to respond to the questions in this exam.      #
# This includes, but is not limited to, resources such as      #
# Google, Stack Overflow, the Course Reader, etc.  The only    #
# restriction is that you may not use live chat, messaging,    #
# email, discourse, Slack, or any other method of real-time    #
# communication with another member of the course or any       #
# other person to formulate your response.                     #
#                                                              #
# As with the homework assignments, place your answers to      #
# each question immediately following the question prompt.     #                                            #
################################################################

wine = read.csv("wine_enthusiast_rankings.csv")

# Question 1. What is the command line symbol that provides 
# a shortcut to your "home" directory on your system.  For 
# example, what symbol would you use in place of "x" in the 
# command "cd x" if you wanted to use the cd command to move 
# into your home directory:

## cd ~

# Question 2. Write R code to assign the value 7 to a variable "x":

x = 7
print(X)

# Question 3. Write R code that subtracts 3 from the variable "x" 
# and assigns the results to a variable "y":

y <- x-3
print(y)

# Question 4. Assign the values 1, 23, 6, 2, 19, 7 to a vector:

Nvector <- c(1, 23, 6, 2, 19, 7)



# Question 5. Run the code `“four” < “five”`. Paste the output 
# from R into a comment and explain why you think it provided 
# that result: [Text Answer]

'apple' < 'orange'
'four' < 'five'
"four" < "five"
## [1] FALSE
## Because R will consider this two as string and 
## perform lexicographic comparison with the strings and 
## because 'i' came before 'o' so it is false


# Question 6. Write a for loop that loops through each element in
# the vector you created in your answer to Question 4 and prints
# each value to screen:

for (i in Nvector) {
  print(i)
}


# Question 7. Assign the value 3 to a variable "x" and write
# a conditional statement that test whether x is less than 5.  
# if it is, print "Yay!" to screen:

x <- 3
# Conditional statement and print
if (x < 5){
  print ("Yay!")
}


# Question 8. Download the "wine_enthusiast_rankings.csv" file from
# the "data" directory in the "Files" area of the course Canvas
# website and then write code to load into a variable called "wine_revs":

wine_revs = read.csv("wine_enthusiast_rankings.csv")



# Question 9.  Write code to determine the class of the "wine_revs"
# data object you created in Question 8 above:



class_wine_revs <- class(wine_revs)
print(class_wine_revs)

#

# Question 10. Write code that returns the column/variable
# names of the "wine_revs" object:
# Show the names of the columns
column_names <- colnames(wine_revs)
print(column_names)
# This show both names of the columns and the type of data for each columns
column_classes <- sapply(wine_revs, class)
print(column_classes)


# Question 11. Write code to load all observations from the
# "price" column/variable of the "wine_revs" object into
# a vector called "wine_prices":

wine_prices <- wine_revs$price
## print(wine_prices)



# Question 12. Subset the "wine_revs" object to create a new 
# data.frame named "wine_revs_truncated" that contains all 
# observations for only the numeric ID, Points, Price, Variety, 
# and Winery columns/variables in "wine_revs": 

wine_revs_truncated <- wine_revs[c("X", "points", "price", "variety", "winery")]
print(wine_revs_truncated)


# Question 13. Save the "wine_revs_truncated" that you created 
# in Question 12 to your local "ist008_assignments" directory 
# as an RDS file named "wine_revs_truncated.rds":
saveRDS(wine_revs_truncated, file = "wine_revs_truncated.rds")


# Question 14. Below is an R function that receives a single 
# argument (an integer) and returns the square root of that
# argument.  Write code (below the function) that calls the 
# function sending it the value 144 as its argument and assigns
# the returned result to a variable "z".  Note:  Be sure to run
# code of the function to load it into your environment before
# you try to call it in your answer or you won't be able to test
# your answer.

getSqrt <- function(argument_1) {
  retval <- sqrt(argument_1) 
  return(retval)
}

z <- getSqrt(144)
print(z)



# Question 15. Write code that you would use to install the "fortunes"
# package onto your local machine and then load it into the working
# R environment:


install.packages("fortunes")
library(fortunes)


# Question 16. Why doesn't R automatically load every installed package when 
# it starts: [Text Answer]

##  Because it can avoid unnecessary memory usage and possibility of having 
##  conflicts between package namespaces, which will cause error


# Question 17. What is the git command to put a directory in your
# file system under git control (create a repository):

## git init

# Question 18. List one advantage and one disadvantage for each of the
# following data file formats: [Text Answer]
#   
#     a. RDS files
##     RDS files preserve object attributes and are space-efficient, 
##     but this is a binary file, so is unreadable for human without R environment
#     b. CSV files
##     CSV files are widely supported and human-readable. 
##     CSV files typically do not offer built-in compression, 
##     resulting in larger file sizes compared to compressed formats like RDS. 
##     This can be a disadvantage when dealing with large datasets, 
##     as it consumes more storage space and increases transfer times.


# Question 19. Describe the Standard Deviation of a data set in
# your own words: [Text Answer]

## Square root of the average squared distance to the mean,
## the distance from a point to a mean is called a deviation.
## And Standard Deviation is the average deviation of each data point 
# from the mean of the data set


# Question 20. Discuss what statisticians mean when they talk about
# finding the "center" of a data set: [Text Answer]
## The "center" of a data set usually they are referring to a measure 
## that represents a typical or central value 
## around which the data tend to cluster. 
## There are several measures of central tendency commonly used in statistics:
## Mode - the value that appears most frequently in a data set.
## Median - can be found in sort the data, the middle value of that sorted dataset,
## if there are even number of data, the median is the average of the two middle values
## The median is robust to outliers and extreme values.
## Mean - also known as the average, is calculated by summing 
## all the values in the dataset and dividing by the number of observations. 
## It represents the balance point of the data distribution.



# To submit your midterm, save this file to your local 
# "ist008_assignments" directory then stage and commit 
# this file and any other files you created as part of 
# the exam to your local repository.  Then push your
# changes to Github.
