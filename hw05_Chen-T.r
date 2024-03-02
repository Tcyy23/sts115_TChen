# emf - good job! some points were lost from incomplete answers. 
# you can find comments below by searching for "emf"

# Directions:

# This file contains homework questions for the lecture on data forensics
# and statistics. Questions appear as comments in the file.

# The first four questions are narrative only, meaning you can just write an
# answer and do not need to write computer code. For other questions, please
# see the Grading Criteria Canvas Page for specific guidance on what
# we expect from you regarding assignment responses.

# Once you have completed the assignment, follow the Submission Instructions
# on Canvas Pages section to add, commit, and push this to your GitHub repository.

# Some questions have multiple parts - make sure to read carefully and
# answer all of them. The majority of points lost in homework come from
# careless skipping over question parts.

###############################################################################

# 1. What is a Frequency Distribution? [comprehension]
# The distribution for the number of observations for each value in a data set


# 2. What is a Relative Frequency Distribution? [comprehension]
## It is similar to a Frequency Distribution,
## but instead of showing the count of each value,
## it shows the proportion or percentage of the total dataset that each value represents.


# 3. What is Deviation a measure of? [comprehension]
## It indicate how much individual data points differ
## from the mean or average of the dataset.


# 4. What is Standard Deviation? [comprehension]

## Square root of the average squared distance to the mean
## (the distance from a point to a mean is called a deviation)
## And Standard Deviation is the average deviation of each data point
# from the mean of the dataset

# 5. Load the Craigslist data and then compute:
#     Read csv and save it to 'cl'
      cl = read.csv("cl_rentals.csv")

#     a. The number of rows and columns. [code completion + comprehension]
#
      # assign number of row and colums in data frame 'cl' to a vector
      num_rows <- nrow(cl)
      num_cols <- ncol(cl)
      # Print the number of rows and columns
      print(num_rows)
      print(num_cols)
      #emf - good - can also use the "dim()" function here & do not need to create new R objects to answer this question
#     b. The names of the columns. [code completion + comprehension]
#
      column_classes <- sapply(cl, class)
      print(column_classes)
      #emf this returns the class of each column - not the names (i.e. variable names)
      
#     c. A structural summary of the data. [code completion + comprehension]

      # Get the Structural summary of the data frame 'cl'
      str(cl)
      
#     d. A statistical summary of the data. [code completion + comprehension]
      # Get a statistical Summary of the data frame 'cl'
      summary(cl)


# 6. The goal of this exercise is to compute the number of missing values in
#    every column of the Craigslist data.

#
#    a. Write a function called `count_na` that accepts a vector as input and
#       returns the number of missing values in the vector. Confirm that your
#       function works by testing it on a few vectors.
#      [code completion + comprehension]
#     # The 'sum()' function is then used to count the number of TRUE values
      # in the logical vector returned by 'is.na(vec)'
        count_na <- function(vec) {
          sum(is.na(vec))
        }
        
        count_na(cl$date_updated)
        count_na(cl$sqrt)
        # It works.
#    b. Test your function on the `pets` column from the Craigslist data. The
#       result should be 14. If you get an error or a different result, try
#       part a again.
#       [code completion + comprehension]
        # Applying the function of count_na on 'cl.pets'
        count_na(cl$pets)
        # 14
#    c. Use an apply function to apply your function to all of the columns in
#       the Craigslist data set. Include the result in your answer.
#       [code completion + comprehension]
        
#        title         text     latitude    longitude         city  date_posted
#        0            0            3            3          952            0
#        date_updated        price      deleted         sqft     bedrooms    bathrooms
#        1801           35            0          347           10           10
#        pets      laundry      parking   craigslist    shp_place     shp_city
#        14            0            0            0           24          650
#        shp_state   shp_county
#        3            3
        
        na_counts <- sapply(cl, count_na)
        #Print out the answers
        print(na_counts)
#    d. Which columns have 0 missing values? [comprehension]
        #"title"       "text"        "date_posted" "deleted"     "laundry"
        #"parking"     "craigslist"
        complete_columns <- names(na_counts[na_counts == 0])
        #print out the columns with no NA
        print(complete_columns)


# 7. What time period does this data cover? Hint: convert the `date_posted`
#    column to an appropriate data type, then use the `range` function.
#    [code completion + comprehension]
        
      # Convert 'date_posted' column to date type
      cl$date_posted <- as.Date(cl$date_posted)
      # Use the range function to find the minimum and maximum dates
      period_covered <- range(cl$date_posted)
      # Print the result
      print(period_covered)
      # emf - make sure you write out your answer here as well - given the output, what time period does this data cover?

# 8. Compute the mean price for each pets category. Based on the means, are
#    apartments that allow pets typically more expensive? Explain, being
#    careful to point out any subtleties in the result.
#    [code completion + comprehension + interpretation]
      # Compute the mean price for each pets category
      # This tells R to group the data from 'cl' by the 'pets' variable and
      # calculate the mean price using 'FUN=mean' for each group.
      mean_price_by_pets <- aggregate(price ~ pets, data = cl, FUN = mean)
      
      
      # Print the result
      print(mean_price_by_pets)
      #emf - missing second part of the question where you interpret the output and come up with a hypothesis 


# 9. The `sort` function sorts the elements of a vector. For instance, try
#    running this code:
#
#    x = c(4, 5, 1)
#    sort(x)
#
#    Another way to sort vectors is by using the `order` function. The order
#    function returns the indices for the sorted values rather than the values
#    themselves:
#
#    x = c(4, 5, 1)
#    order(x)
#
#    These can be used to sort the vector by subsetting:
#
#    x[order(x)]
#
#    The key advantage of `order` over `sort` is that it can also be used to
#    sort one vector based on another, as long as the two vectors have the same
#    length.
#
#    Create two vectors with the same length, and use one to sort the elements
#    of the other. Explain how it (should) work.
#    [code completion + comprehension]
      # Create two vectors
      x <- c(1, 3, 2, 5, 4)
      y <- c("apple", "banana", "orange", "grape", "strawberry")
      
      # Use 'order' to get the index that would sort vector 'x'
      sorted_indices <- order(x)
      
      # Use the sorted index to rearrange vector 'y' based on the sorting of 'x'
      sorted_y <- y[sorted_indices]
      
      # Print the result
      # [1] "apple"      "orange"     "banana"     "strawberry"    "grape"
      print(sorted_y)
## I get the index that would sort x from 1 to 5
## Then, I use this sorted index to rearrange vector y,
## resulting in y being sorted based on the values in x.

# 10. Use the `order` function to sort the rows of the Craigslist data set
#     based on the `sqft` column. [code completion + comprehension]
##    Filter out NA values in the 'sqft' column
      cl_filtered <- cl[!is.na(cl$sqft), ]
      sorted_indices <- order(cl_filtered$sqft)
      sorted_cl <- cl_filtered[sorted_indices, ]
      
#     a. Compute a data frame that contains the city, square footage, and price
#        for the 5 largest apartments. [code completion + comprehension]
#
      # Print the last 5 data to examine the largest square footage values
      largest_apartments <- sorted_cl[nrow(sorted_cl):(nrow(sorted_cl)-4), c("city", "sqft", "price")]
      print(largest_apartments)
      # Print the first 20 data to examine the smallest square footage values
      smallest_apartments <- head(sorted_cl, 20)[, c("city", "sqft", "price")]
     
      # Printing the data for the smallest apartments
      print(smallest_apartments)
      # Out of the 20 data there are only about 3-5 seem incorrect out of 2640 data
#     b. Do you think any of the 5 square footage values are outliers? Explain
#        your reasoning. [interpretation]
#
#       No because I think most of the data values are collect and recorded correctly
      # and I got the smallest 20 and the largest 5 data from the 'sorted_cl list
      # most of them seem legit
      # emf - smallest apt is 200 - not 20 sqft/good info but does not answer the question directly - need to specify what you mean by "seem legit" 
      
#     c. Do you think any of the 5 square footage values are erroneous
#        (incorrect in the data)? [interpretation]

      # It could because from the data set I found two values is a lot larger than expected,
      # and the 'price' is not normal than most of the other for it 'sqft'.
      # But most of the value seem correct to me.
      
      # emf - what specific two values are you talking about here?


