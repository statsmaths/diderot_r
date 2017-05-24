# Title: "Textual models"
# Name:

# If you don't have it yet:
install.packages("cleanNLP")

# Load core packages
library(stringr)
library(dplyr)
library(ggplot2)
library(readr)
library(cleanNLP)

theme_set(theme_minimal())

##############################################################################
# 01. We will again read in the jane austin dataset:

ja <- read_csv("http://math209.taylorarnold.net/janeausten.csv")

# This time, however, we'll break the dataset up into 2000 word chunks:

ja <- mutate(ja, chunk = str_c(book, "-", sprintf("%04d", 1:nrow(ja) %/% 2000)))

# We will do our analysis at this level.

##############################################################################
# 02. As in the worksheet, create a tf-idf matrix using `get_tfidf` and the
# same settings, using only the non-proper nouns. However, this time you
# will need to set "doc_var" to "chunk". How large is this matrix?



# It should have 441 rows!

##############################################################################
# 03. Using the `tidy_pca` function, compute the first two principle
# components of the data:



# We'll also add data about each chunk:

pca <- mutate(pca, chunk = unique(ja$chunk))
pca <- mutate(pca, book = str_sub(chunk, 1, -6))

##############################################################################
# 04. Draw a scatter plot of the principal components. How well do the
# particular books separate out?




##############################################################################
# 05. Try to tweak the parameters to question 2 to improve the distinctions
# between the novels.


