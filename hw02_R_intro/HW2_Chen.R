library(readr)
my_data <- read_csv("Desktop/STS_115/hw02_R_intro/my_data.csv")

# 1. Interview 5 people from outside of STS115 and add their data to the “my_data” data frame from class to create a new data frame called “our_data”. You will use this for the subsequent questions. (Please do not interview someone who a classmate has already interviewed. You can call, Zoom, etc. but you need to actually talk to other human beings to complete this assignment!)
new_data <- data.frame(
  major = c("Economics", "Art and Technology", "Chemistry", "Economics", "Physics"),
  location = c("Library", "Starbucks", "At home", "Library", "West Lake"),
  distance.mi = c(0.5, 1.2, 0.9, 0.8, 2.5),
  time.min = c(3, 6, 4, 5, 1),
  pet = c("Woof", 
          "Cats rule, dogs drool", 
          "Woof", 
          "Cats rule, dogs drool", 
          "Cats rule, dogs drool")
)

our_data <- rbind(my_data, new_data)

# 2. Come up with a yes/no or true/false question you’d have liked the survey to have asked. Make up these data for every subject in the survey, then create it as a logical vector and add it to the data frame.
# Are you acquainted with Idrila the Beauty is the most peerless beauty of them all?
responses <- sample(c(TRUE, FALSE), nrow(our_data), replace = TRUE)
our_data$responses <- responses

# 3. Use a single function to return the class of each column in the data frame.
column_classes <- sapply(our_data, class)
print(column_classes)

# 4. Look up how to use the function `max`. Use it to calculate the longest commute distance and travel time.
longest_commute_distance <- max(our_data$distance.mi)
longest_travel_time <- max(our_data$time.min)
print(longest_travel_time)

# 5. Calculate travel speed across subjects as miles per minute. Assign this to a new vector `mi.per.min` and add it to the data frame.
mi.per.min <- our_data$distance.mi / our_data$time.min
our_data$mi.per.min <- mi.per.min

# 6. Use a function to return the total number of elements in mi.per.min.
total_elements <- length(mi.per.min)
print(total_elements)

# 7. Index/subset the vector `major` to get a new vector that contains the 3rd, 1st, and 9th elements (in that order).
subset_major <- our_data$major[c(3, 1, 9)]
print(subset_major)

# 8. R’s `[` indexing operator accepts several different types of indexes, not only positive whole numbers. For example, the operator accepts negative numbers as indexes. Using the vector `places`, try out three to five different negative indexes. Based on the results, what do you think the [ operator does with negative indexes?
# It remove the element at 2
negative_index_result_1 <- our_data$location[-2]
print(negative_index_result_1)
negative_index_result_2 <- our_data$location[-1]
print(negative_index_result_2)
negative_index_result_3 <- our_data$location[c(-12, -4, -6)]
print(negative_index_result_3)

# 9. Consider the R code `c(3, 3.1, “4”, -1, TRUE)`.
# a. WITHOUT running the code, what data type you think the result will have and why?
## I'm guessing it will be a list. Because it is a list of data. 
# b. Now run the code to check whether your guess was correct. If it was not correct, explain what the actual data type is and why. If your guess was correct, write a new, different line of code that yields the same resulting data type.
result <- c(3, 3.1, "4", -1, TRUE)
print(result)
print(class(result))
## It said it is a character, maybe R tend to make them into a common type, since they all could be "chr"
## Something else I found out if I modify it to this c(3, 3.1, "4", -1, TRUE, class) 
## it will show as "double" "double" "character" "double" "logical" "function"
## because at this time class couldn’t be a "chr" so it spread all of them


# 10. Run the code `“four” < “five”`. Paste the output from R into a comment and explain why you think it provided that result.
## > "four" < "five"
## [1] FALSE
## Because R will perform lexicographic comparison with the string

# 11. There are several major mistakes in the data entered in class.
# a. Describe in complete sentences what at least 2 of the errors are. Make some guesses as to how those errors may have happened, and how they might affect analyses and/or re-use of these data.
# There are several distance.in and time.min are enormously larger than the others and there are two missing the data of distance.in and time.min.
# Maybe it was a mistypes, during the survey. Or maybe the error happens during the converting to csv.
# It will cause our analysis inaccurate. We can survey the individual once again to verify if it a mistake or the actual data.

# b. Pretend the data frame was too big for you to view it manually. List specific function calls you could use in R to help you find these mistakes programmatically.
# summary(), str(), head(), tail(), typeof()
# is.na() can be used to check for missing values.
# unique() can be used to identify unique values in columns.
unique_distance <- unique(our_data$distance.mi)

print("Unique distance.mi:")
print(unique_distance)


