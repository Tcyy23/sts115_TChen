# emf - good job overall - you can find comments below by searching for "emf"

# Directions:

# This file contains homework questions for the lecture on data visualization.
# Questions appear as comments in the file. 

# Please see the Grading Criteria Canvas Page for specific guidance on what
# we expect from you regarding assignment responses.

# Once you have completed the assignment, follow the Submission Instructions 
# on Canvas Pages section to add, commit, and push this to your GitHub repository. 

# Some questions have multiple parts - make sure to read carefully and
# answer all of them. The majority of points lost in homework come from
# careless skipping over question parts.  

###############################################################################
library(ggplot2)
dogs = readRDS('dogs.rds')

# 1. All of the questions in this homework use the Best in Show data set. 
#      The data is the file `dogs.rds`.
#   a. Load the data set and use R functions to inspect the number of 
#      columns, number of rows, names of columns, and column data types.
#      [code completion + comprehension]

cat("Number of columns:", ncol(dogs), "\n")
cat("Number of rows:", nrow(dogs), "\n")
cat("Column names:", names(dogs), "\n")
cat("Column data types:", sapply(dogs, class), "\n")
# Number of columns: 18 
# Number of rows: 172 
# Column names: breed group datadog popularity_all popularity lifetime_cost intelligence_rank longevity ailments price food_cost grooming kids megarank_kids megarank size weight height 
# Column data types: character factor numeric integer integer numeric integer numeric integer numeric numeric factor factor integer integer factor numeric numeric 

#   b. Make a scatter plot that shows the relationship between height and
#      weight. In 2-3 sentences, discuss any patterns you see in the plot.
#      [code completion + comprehension + interpretation]
# Most of the dogs we have in our data set, the dog with a higher height also is heavier in weight.
# And short dogs usually have less weight.
ggplot(dogs, aes(x = height, y = weight)) +
  geom_point() +
  labs(x = "Height", y = "Weight") +
  ggtitle("Relationship between Height and Weight")

#   c. Set the color of the points in the scatter plot from part b to a single 
#      color of your choosing. (Tip: Choose a color from one of the sites 
#      shared in the lesson (e.g. https://coolors.co/palettes/trending))
#      [code completion + comprehension]

ggplot(dogs, aes(x = height, y = weight)) +
  geom_point(color = "#219ebc") + 
  labs(x = "Height", y = "Weight") +
  ggtitle("Relationship between Height and Weight")



# 2.
#   a. Make a bar plot that shows the number of dogs in each "group" of dogs.
#      [code completion + comprehension]
    ggplot(dogs, aes(x = group)) +
      geom_bar() +
      labs(x = "Group", y = "Number of Dogs") +
      ggtitle("Number of Dogs in Each Group")
#   b. Are any groups much larger or smaller than the others? Describe what your 
#       visualization shows.
#      [interpretation]
    # Non-sporting and toy group are much smaller than the others.
    
#   c. Fill in the bars based on the size of the dog, and set the position 
#       argument of the bar geometry to the one you think best communicates the 
#       data. Explain why you chose this position.
#      [code completion + comprehension + interpretation]
    ggplot(dogs, aes(x = group, fill = size)) +
      geom_bar(position = "dodge") +
      labs(x = "Group", y = "Number of Dogs") +
      ggtitle("Number of Dogs in Each Group by Size")
# Using the "dodge" position argument, we can present each size category side by side 
# within each group, allowing for a clear visual comparison of the distribution of dog sizes within each group.
    
    # emf - good - the bars in this plot have some variation in their widths based on how many size categories are included - is there a way to make these more uniform?


# 3.
#   a. Which geometry function makes a histogram? Use the ggplot2 website or
#      cheat sheet to find out.
    ## geom_histogram()
#      [code completion + comprehension]
#   b. Make a histogram of longevity for the dogs data. How long do most dogs
#      typically live? Explain in 1-2 sentences.
#      [code completion + comprehension + interpretation]
#    Most of them live between 7 - 15, a few will live longer than 15 years
#    Most dogs live around 9-13 years, as indicated by the peak of the histogram
    ggplot(dogs, aes(x = longevity)) +
      geom_histogram() +
      labs(x = "Longevity", y = "Frequency") +
      ggtitle("Histogram of Dog Longevity")
#   c. Inside the geometry function for histograms, play around with the bins
#      argument. (e.g. bins = 10, bins = 50). What do you think this is doing?
#      [code completion + comprehension]
    
    ggplot(dogs, aes(x = longevity)) +
      geom_histogram(bins = 50) +
      labs(x = "Longevity", y = "Frequency") +
      ggtitle("Histogram of Dog Longevity")
#     Increasing the number of bins will result in smaller intervals and potentially 
#     more detailed information about the distribution of longevity in the data.
#     A low number of bins will result in smoothing out the graph, 
#     we could miss some important detain in the data     
# 4.
#   a. Modify your plot from Question 1 so that the shape of the points is
#      determined by the "group" of the dog. [code completion + comprehension]
    
    ggplot(dogs, aes(x = height, y = weight, shape = group)) +
      geom_point(color = "#219ebc") + 
      labs(x = "Height", y = "Weight") +
      ggtitle("Relationship between Height and Weight")
    
    # emf - this plot is missing a representation/shape for the "working" category of dogs - do you know why this happened? do you think this changes your answer for part b and c?
#   
    
#   b. Do height and weight effectively separate the different groups of dogs?
#      In other words, are there clear boundaries between the groups in the
#      plot (as opposed to being mixed together)? Are some groups better
#      separated than others?
#      [interpretation]
    # There is a better view between the group in the plot, 
    # but because the color of the shape is the same, it still isn't effective enough.
    # emf - it seems like you are commenting on the effectiveness of the visualization rather than whether height and weight "effectively" separate the different groups
    
#   c. How might you improve the readability of this graph in order to visualize
#      this potential relationship more clearly?
#      [interpretation]
# I would assign different colors to each group which will improve the readability of this graph

# 5. In a paragraph, answer the following questions for the “Best in Show” 
#    visualization (https://informationisbeautiful.net/visualizations/best-in-show-whats-the-top-data-dog/) 
#    that was built using the dogs dataset.
#    a. Who do you think is the intended audience for this data visualization? 
#        How do you think that could influence data collection, metrics calculations, 
#        and graphics choices?
#       [interpretation]
#    I think the intended audience for this graph is the people who is looking to get a dog, 
#     maybe is for sport, maybe for working, and which dog is the best to get. 
    # I think if the graph's intended audience is the researcher in dogs it wouldn't focus on the popularity.
    
#    b. Who/what is included in this data visualization and who is left out? 
#        What do you think the impact of that decision could be on conclusions drawn
#        from viewers of the data visualization? 
#       [interpretation]
#   The data include dog breed intelligence, characteristics, and suitability for different roles or activities, but left out the 
#   the variations in temperament, or environmental factors that could affect their suitability as pets or working animals.
#    This could impact on the conclusions drawn by viewers, 
#    as they may overlook important considerations when selecting a dog based on only the breed popularity or general characteristics.

#    c. What could the potential impact of this visualization be on those 
#       who are left-out? [interpretation]
# The visualization may be more specify, the type of dog who have better adaptability may be a more popular one. 


# 6. Select your favorite data visualization from https://viz.wtf/ 
# (that was not featured during class or in the reader). 
#   a. Type the direct url to the viz you selected here:
    #https://www.dreamstime.com/composition-bee-honey-vector-illustration-labeled-food-structure-scheme-educational-percentage-graphic-organic-glucose-image187241266
    
#   b. Describe in a few sentences the "data story" you think that this visualization 
#       is trying to tell.
    # It is a graph of composition of bee honey, I think it wants to tell the viewer 
    # what are the nutrient that is good for people in the bee honey
    
#   c. In a paragraph, what makes this a "bad" visualization? Evaluate the visualization 
#       based on the visualization principles and perception rules discussed in class 
#       (i.e., Gestalt principles, plot type, accessibility, critical reading, etc.), 
#       and suggest a few changes to improve the graphic.
    # The percentage of the glucose and fructose, they are closed on percentage but on the visualization
    # The fructose seems a lot larger than glucose. 
    
    # emf - missing suggestions for changes to improve the visualization
    
#   d. Describe in 1-2 sentences one thing that this visualization actually already does well.
# The shape of the graph is the most notable one which is quiet creative, and the color choice of it is also really great, 
# it choice the that is well represent the honey and didn't effect the readability. 


# 7. Look at the plot posted with this assignment on Canvas.
#    a. Identify the marks and channels in this plot. Write them out for this answer
    unique_groups <- unique(data$group)
    print(unique_groups)
    # the group of dogs
    #  "herding"      "terrier"      "sporting"     "toy"          "working"     
    # "non-sporting" "hound"
    # emf - unclear how you are answering 7a
    
#    b. Write the code to generate this plot. (Hint: start with identifying the 
#        variables on each axis, then think about the types of channels).
unique_groups <- unique(data$group)
print(unique_groups)

ggplot(dogs, aes(x = longevity, y = lifetime_cost, color = group, shape = group)) +
  geom_point() +
  labs(x = "Longevity(years)", y = "lifetime_cost") +
  ggtitle("Dogs")+
  guides(color = guide_legend(title = "Group"), shape = guide_legend(title = "Group"))

#    c. Propose 4 improvements to the plot based on best practices.

#     Shape, Color, Rename the legend for better readability, 
#     Rename the title for viewer have a better understand the visualization, 
#     Specify the shapes manually for working

#    d. Modify the code to implement at least two of those changes.

ggplot(dogs, aes(x = longevity, y = lifetime_cost, color = group, shape = group)) +
  geom_point() +
  labs(x = "Longevity", y = "Lifetime Cost") +
  ggtitle("Longevity vs. Lifetime Cost for Dogs") +
  guides(color = guide_legend(title = "Group"), shape = guide_legend(title = "Group")) +
  # Adjust shape codes manually
  scale_shape_manual(values = c(1, 2, 3, 4, 5, 6, 7)) 

# emf - good modifications! 
