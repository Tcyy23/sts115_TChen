# emf - good job! see comments below

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

#install.packages(stringr)
library(stringr)

# Write an R code snippet that uses regular expressions to find all occurrences of 
# dates in the string variable text that are in the format "dd/mm/yyyy" and replace 
# them with the format "yyyy-mm-dd". The text variable contains multiple dates in 
# the "dd/mm/yyyy" format interspersed with other text. For example, if text is 
# "The event was held on 23/04/2021 and the next event will be on 05/10/2022.", 
# the output should be "The event was held on 2021-04-23 and the next 
# event will be on 2022-10-05.".
#
# Ensure your code dynamically handles the text variable, meaning it should work 
# for any string input following the mentioned pattern. Use relevant functions from 
# the stringr package, any other package, or base R for your solution.
sample_text <- c("The event was held on 23/04/2021 and the next event will be on 05/10/2022.")

str_replace_all(sample_text,"(0[1-9]|[1-2][0-9]|3[0-1])/(0[1-9]|1[0-2])/(\\d{4})","\\3-\\2-\\1")

# Input text variable
text <- "The event was held on 23/04/2021 and the next event will be on 05/10/2022."

# Define regular expression pattern to match dates in "dd/mm/yyyy" format
pattern <- "\\b(\\d{2})/(\\d{2})/(\\d{4})\\b"

# Replace dates matching the pattern with "yyyy-mm-dd" format
formatted_text <- str_replace_all(text, pattern, "\\3-\\2-\\1")

# Output the formatted text
print(formatted_text)


# Write an R code snippet that assigns the string "I am here.  Am I alive" to
# a variable "x" and uses an Escape Sequence to put a newline between the two
# sentences.

x <- "I am here. \nAm I alive"
x <- str_replace_all(x, "\\n", "\n") # emf - what is your reasoning for doing this?
cat(x)



# Write an R code snippet that assings the following string to the variable "y:"
#
# She said, "Hi!"

y <- "She said, \"Hi!\""
cat(y)




# [TEXT ANSWER] Explain what a Text Encoding is:
# Because Computers store data as numbers. In order to store text on a computer, 
# we have to agree on a character encoding, a system for mapping characters to numbers. 
# It's like a secret code that turns letters, numbers, 
# and symbols into a format computers can handle.
# For example there are different encoding schemes, like ASCII or UTF-8, 
# define which code point corresponds to each character.





# Write an R code snippet that creates a vector of all containing the words in the string, 
# "He wanted to say hello but was afraid".  Then use the stringr library to locate any 
# occurences of the string "hello" in your vector.

# Define the input string
input_string <- "He wanted to say hello but was afraid"

# Create a vector containing all the words in the string
word_vector <- str_split(input_string, "\\s+")[[1]]

# Use stringr to locate any occurrences of the string "hello" in the vector
hello_indices <- which(word_vector == "hello")

# Print the indices of occurrences
print(hello_indices)




# Section "15.8 Corpus Analytics" of the reader contains a tutorial on performing
# corpus analytics on a Document Term Matrix of 19th Century novels.  A Document Term
# Matrix is a matrix that contains information about the number of times that a work 
# appears in each text in a corpus.  In class, we calculated the word frequencies for
# the novel _Wuthering Heights_.  There "data" folder in the Files area of Canvas for 
# this course contains a file names dtm.rds which holds this type of count information
# for every normalized text in the collection of novels we worked with in class. 
# First, download that file to your couse working directory.   Then, recreate a working
# version of the code in section 15.8 of the reader below.  Note that before you can 
# use the code in that section you will need to read dtm.rds file into the dtm variable
# so that the data ih the DTM is available to the rest of the code.
library(cluster)
library(tidyverse)
library(tokenizers)
library(tm)
dtm <- readRDS("dtm.rds")
manifest <- read.csv("C19_novels_manifest.csv", row.names = 1)
str(manifest)

manifest$genre <- as.factor(manifest$genre)
inspect(dtm)
findFreqTerms(dtm, 1000)
findAssocs(dtm, "boat", .85)

writing <- findAssocs(dtm, "writing", .85)
writing[[1]][1:15]

dtm <- lapply(dtm, paste, collapse = " ")
corpus <- Corpus(VectorSource(files))

corpus[[6]]
str_sub(corpus[[6]]$content, start = 1, end = 500)

frankenstein <- corpus[[6]]$content
frankenstein <- str_replace_all(frankenstein, pattern = "[^A-Za-z]", replacement = " ")

frankenstein <- str_split(frankenstein, " ")

frankenstein <- lapply(frankenstein, function(x) x[x != ""])

cleaned_corpus <- tm_map(
  corpus,
  tokenize_words,
  stopwords = stopwords('SMART'),
  lowercase = TRUE,
  strip_punct = TRUE,
  strip_numeric = TRUE
)

cleaned_corpus <- lapply(cleaned_corpus, paste, collapse = " ")
cleaned_corpus <- Corpus(VectorSource(cleaned_corpus))
saveRDS(cleaned_corpus, "C19_novels_cleaned.rds")
cleaned_corpus <- readRDS("C19_novels_cleaned.rds")

term_counts <- as.matrix(dtm)
term_counts <- data.frame(sort(colSums(term_counts), decreasing = TRUE))
term_counts <- cbind(newColName = rownames(term_counts), term_counts)
colnames(term_counts) <- c("term", "count")

dtm <- DocumentTermMatrix(cleaned_corpus)
ggplot(
  data = term_counts[1:50, ], 
  aes(
    x = fct_reorder(term, -count), 
    y = count)
) +
  geom_bar(stat = "identity") + 
  theme(
    axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)
  ) + 
  labs(
    title = "Top 50 words in 18 Nineteenth-Century Novels", 
    x = "Word", 
    y = "Count"
  )

dtm_tfidf <- DocumentTermMatrix(
  cleaned_corpus,
  control = list(weighting = weightTfIdf)
)
dtm_tfidf$dimnames$Docs <- manifest$title

# Transform DTM into a matrix and then a data frame for term counts
term_counts <- as.matrix(dtm)
term_counts <- data.frame(sort(colSums(term_counts), decreasing = TRUE))
term_counts <- cbind(term = rownames(term_counts), term_counts)
colnames(term_counts) <- c("term", "count")

# Plot top 50 terms in corpus
library(ggplot2)
ggplot(data = term_counts[1:50, ], aes(x = reorder(term, -count), y = count)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  labs(title = "Top 50 words in 18 Nineteenth-Century Novels", x = "Word", y = "Count")

# Calculate tf-idf scores
dtm_tfidf <- weightTfIdf(dtm)

dtm_tfidf <- DocumentTermMatrix(
  cleaned_corpus,
  control = list(weighting = weightTfIdf)
)
dtm_tfidf$dimnames$Docs <- manifest$title
# Get top terms using tf-idf scores
tfidf_counts <- as.matrix(dtm_tfidf)
tfidf_counts <- data.frame(sort(colSums(tfidf_counts), decreasing = TRUE))
tfidf_counts <- cbind(term = rownames(tfidf_counts), tfidf_counts)
colnames(tfidf_counts) <- c("term", "tfidf")

# Plot top 50 terms with tf-idf scores
ggplot(data = tfidf_counts[1:50, ], aes(x = reorder(term, -tfidf), y = tfidf)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  labs(title = "Words with the 50-highest tf--idf scores in 18 Nineteenth-Century Novels", x = "Word", y = "TF-IDF")

findAssocs(dtm_tfidf, terms = "writing", corlimit = .85)
tfidf_df <- as.matrix(dtm_tfidf)
tfidf_df <- as.data.frame(t(tfidf_df))
colnames(tfidf_df) <- manifest$title

# Find unique terms in specific documents
unique_terms_WutheringHeights <- rownames(tfidf_df[order(tfidf_df$WutheringHeights, decreasing = TRUE)[1:50], ])
print(unique_terms_WutheringHeights)

unique_terms_Frankenstein <- rownames(tfidf_df[order(tfidf_df$Frankenstein, decreasing = TRUE)[1:50], ])
print(unique_terms_Frankenstein)

unique_terms_Dracula <- rownames(tfidf_df[order(tfidf_df$Dracula, decreasing = TRUE)[1:50], ])
print(unique_terms_Dracula)

Senseand_Sensibility <- rownames(tfidf_df[order(tfidf_df$SenseandSensibility, decreasing = TRUE)[1:50], ])
print(Senseand_Sensibility)