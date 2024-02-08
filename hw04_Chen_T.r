# Directions:

# This file contains homework questions for the lecture on working with files
# and data exploration. Questions appear as comments in the file. 

# Please see the Grading Criteria Canvas Page for specific guidance on what
# we expect from you regarding assignment responses.

# Once you have completed the assignment, follow the Submission Instructions 
# on Canvas Pages section to add, commit, and push this to your GitHub repository. 

# Some questions have multiple parts - make sure to read carefully and
# answer all of them. The majority of points lost in homework come from
# careless skipping over question parts.  

###############################################################################

# 1. Write out the file extension and explain what it means for the following
#    files: [comprehension]
#
#       a. `myscript.py`
##       File Extension: .py
##       Explanation: This indicates that this is a Python script file.
#       b. `/home/arthur/images/selfie.jpg`
##       File Extension: .jpg
##       Explanation: This indicates that this is a picture in jpg file in the directory of /home/arthur/images.
#       c. `~/Documents/data.csv`
##       File Extension: .csv
##       Explanation: This indicates that this is a comma-separated values, 
##       and this csv file in the ~/Documents directory.

# 2. Which command line utility can be used to determine the type of a file? 
# [code completion]

# for cmd we can use the "file" command like this "file data.csv" and it will return the type of data
# for R we can use this to determine the type of a file like this
  tools::file_ext("data.txt")

# 3. Why is it a bad idea to explicitly call the `setwd` function within an R
#    script? [comprehension]

# because it makes the script less portable and may lead to unintended consequences, 
# such as altering the working directory of the entire R session, 
# which could interfere with other scripts or analyses.

# 4. List one advantage and one disadvantage for each of these formats:
# [comprehension]
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

# 5. Why doesn't R automatically load every installed package when it starts?
# [comprehension]

##  Because it can avoid unnecessary memory usage and possibility of having 
##  conflicts between package namespaces, which will cause error


# 6. Load the dogs data from the `dogs.rds` file provided in lecture.
#
library("readxl")

dogs = readRDS('dogs.rds')
#     a. How many missing values are in the `height` column? 
#       [code completion + comprehension]
#     This code checks each value in the height column of the dogs dataset to see 
#     if it's missing (NA). 
#     It returns a logical vector where TRUE indicates a missing value and 
#     FALSE indicates a non-missing value. And sum them up save it to 'missing_height'
      missing_height <- sum(is.na(dogs$height))
      #The are 13 missing value in 'height' column
      #Print out the answer 
      print(missing_height)
#     b. Think of a strategy to check the number of missing values in every
#        column using no more than 3 lines of code. Hint: think about last
#        week's lecture. Explain your strategy in words. 
#       [code completion + comprehension]
#
      # Create a numeric vector to store the count of missing values for each column
      missing_per_column <- numeric(ncol(dogs))
      for (i in 1:ncol(dogs)) { # Iterate over each column of the 'dogs' data frame
        missing_per_column[i] <- sum(is.na(dogs[[i]])) # Count the missing values in the current column and store the result
      }
      #debugging line
      print(missing_per_column)# Print the vector containing the count of missing values for each column

#     c. Which column has the most missing values? Try to solve this by
#        implementing your strategy from part b. If that doesn't work, you can
#        use the `summary` function to get the number of missing values in each
#        column as well as a lot of other information (we'll discuss this
#        function more next week).
#       [code completion + comprehension]
      
      # column number 17 which is the 'weight' from the data frame
      # Find the index of the element with the maximum value in the 'missing_per_column' vector
      column_with_most_missing <- which.max(missing_per_column)
      # Print out the index of the column with the most missing values
      print(column_with_most_missing)

# 7. Use indexing to get the subset of the dogs data which only contains large
#    dogs that are good with kids (the category `high` in the `kids` column
#    means good with kids). [code completion + comprehension]
      
      # Filter the dogs data to get only large dogs that are good with kids
      large_dogs_good_with_kids <- subset(dogs, size == "large" & kids == "high")
      # Print out the data
      print(large_dogs_good_with_kids)

# 8. With the dogs data:
#
#     a. Write the condition to test which dogs need daily grooming (the result
#        should be a logical vector). Does it contain missing values? 
#       [code completion + comprehension]
#       Yes it does contain missing value
        grooming_condition <- dogs$grooming == "daily"
        print(is.na(grooming_condition))  # Check for missing values visually
        print(any(is.na(grooming_condition))) # return true if any dog need grooming daily
        
#     b. Use the condition from part a to get the subset of all rows containing
#        dogs that need daily grooming. How many rows are there?
#       [code completion + comprehension]
        
#       Filter the 'dogs' data frame to select rows where grooming is daily
        daily_grooming_dogs <- dogs[grooming_condition, ]
        #Print out the number of row of dogs that need daily grooming
        print(nrow(daily_grooming_dogs))
#     c. Use the `table` function to compute the number of dogs in each
#        grooming category. You should see a different count than in part b for
#        daily grooming. What do you think is the reason for this difference?
#       [code completion + interpretation]
##      Because this does only apply for daily grooming but select rows where grooming has data 
        #Create a table for grooming categories
        grooming_table <- table(dogs$grooming)
        #Print out the table
        print(grooming_table)
#     d. Enclose the condition from part a in a call to the `which` function,
#        and then use it to get the subset of all rows containing dogs that
#        need daily grooming. Now how many rows are there? Does the number of
#        rows agree with the count in part c?
#       [code completion + comprehension]
        # There are 23 rows, it does match number in the table for daily
        # Filter dogs based on the grooming condition using 'which' 
        # so which dogs is in daily condition "grooming_condition" is from the earlier code
        daily_grooming_dogs <- dogs[which(grooming_condition), ]
        # Print the number of rows in the subset
        print(nrow(daily_grooming_dogs))

# 9. Compute a table that shows the number of dogs in each grooming category
#    versus size. Does it seem like size is related to how often dogs need to
#    be groomed? Explain your reasoning. [code completion + interpretation]
        # Create a table of grooming category versus size
        grooming_size_table <- table(dogs$grooming, dogs$size)
        # Print out the table
        print(grooming_size_table)
        # Looking at the table, we can see that larger dogs tend to have 
        # fewer instances of daily grooming compared to smaller dogs
        # even though the different is small due to the size of data, 
        # but there is a tend to lead to it.
        # I believe with our data scale increase we will have a better view to this
# 10. Compute the number of dogs in the `terrier` group in two different ways:
#
#     a. By making a table from the `group` column. 
#       [code completion + comprehension]
##      Create a table of dog groups
        terrier_count_table <- table(dogs$group)
        # Print the count of terrier dogs from the table
        print(terrier_count_table["terrier"])
#     b. By getting a subset of only terriers and counting the rows.
#       [code completion + comprehension]
#       # Count the rows where the group is "terrier"
        terrier_count <- sum(dogs$group == "terrier", na.rm = TRUE)
        # Print the count of terrier dogs
        print(terrier_count)
        
#     c. Computing the table is simpler (in terms of code) and provides more
#        information. In spite of that, when would indexing (approach b) be more
#        useful? [comprehension + interpretation]

##       I think Indexing approach b is more useful when you specifically 
##       need the count or details of a subset of data in coding wise, and it more understandable 
##       than a. But approach a will also print out the "terrier" and the number 
##       in readability it is more useful than approach b.
