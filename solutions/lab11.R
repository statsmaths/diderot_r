# Title: "NLP with cleanNLP"
# Name:

# Load core packages
library(stringr)
library(dplyr)
library(ggplot2)
library(readr)

theme_set(theme_minimal())

##############################################################################
# 01. We can read in the parsed text without needing to set up anything
# special (Note: this file is relatively large):

ja <- read_csv("http://math209.taylorarnold.net/janeausten.csv")

##############################################################################
# 02. Using the "pos" tag, find the most common proper nouns (NNP) in each
# text. I suggest saving as a dataset named `temp` and looking at it in the
# data viewer. What do you notice about these?

temp <- filter(ja, pos == "NNP")
temp <- count(temp, book, word, sort = TRUE)

##############################################################################
# 03. Use the named entity tags to find the most frequently mentioned people
# in each text. How does this relate to just using the POS tags?


##############################################################################
# 04. Use the named entity tags again, but now find the most frequently
# mentioned locations. Did these pop up in your answer to question 2?


##############################################################################
# 05. Compute the average sentence lengths for each novel and draw a plot
# showing these.


##############################################################################
# 06. Now measure the number of words per sentence using a boxplot with
# geom_boxplot().


##############################################################################
# 07. Create a dataset pride containing only those lines related to the novel
# "Pride & Prejudice":

pride <- filter(ja, book == "Pride & Prejudice")

##############################################################################
# 08. Using the dependencies, what verbs are most associated with Edmund?
# How about Crawford, Rushworth, and Norris? How, if at all, do these differ?

temp <- filter(pride, word == "Edmund")
temp <- filter(temp, relation == "nsubj")
count(temp, lemma_source, sort = TRUE)

temp <- filter(pride, word == "Crawford")
temp <- filter(temp, relation == "nsubj")
count(temp, lemma_source, sort = TRUE)


##############################################################################
# 09. As in the worksheet, create a temporary dataset consisting of only
# tokens with a dependency "dobj" and join this to the data word_frequency
# by the lemma source (see worksheet). Filter out common words and see how
# Well this technique describes what is going on in each novel. Note: you
# will probably have to do this seperately for each one.





