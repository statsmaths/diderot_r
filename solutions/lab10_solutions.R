# Title: "Tidytext"
# Name:

# You will need to install these packages if you
# not already done so
install.packages("stringr")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("readr")
install.packages("ggrepel")
install.packages("tidytext")

# Now load them in:
library(stringr)
library(dplyr)
library(ggplot2)
library(readr)
library(ggrepel)
library(tidytext)

theme_set(theme_minimal())

##############################################################################
# 01. Using the data wpage_p you created in lab 09, create a "clean" data
# set that has only the text:

wpage <- select(wpage_p, text = line_clean)

# Now apply the tidy text package to get a dataset of the word; name it
# wpage_word:

wpage_word <- unnest_tokens(wpage, word, text)

##############################################################################
# 02. Removing stopwords, what are the most common words? Would someone get
# sense of the articles themes from these or not?



##############################################################################
# 03. Merge the dataset with the part of speech data and save the result as
# wpage_pos. What are the top Nouns? Do these give you a better sense of what
# the page is about? How about the verbs?


##############################################################################
# 04. Wikipedia tries to keep a "neutral tone" in its articles. Use sentiment
# datasets to hypothesis whether this is well supported by the data. What
# complications might exist from this analysis?


##############################################################################
# 05. We will once again read in the airbnb dataset from yesterday:

airbnb <- read_csv("https://statsmaths.github.io/stat_data/paris_airbnb.csv")

# The following code creates metadata that describes the median location
# each neighbourhood, which will be useful shortly:

meta <- summarise(group_by(airbnb, neighbourhood),
                  lat = mean(latitude),
                  lon = mean(longitude))

# We will select only some columns of the data to make it easier to work
# with:

airbnb <- select(airbnb, id, text = name, neighbourhood)

##############################################################################
# 06. Create a dataset airbnb_word that applies tidytext to extract words from
# the data:

airbnb_word <- unnest_tokens(airbnb, word, text)

##############################################################################
# 07. Create a dataset that counts how often each word is used in each
# neighbourhood. This time save the results as a dataset `abb_count`:

abb_count <- count(airbnb_word, neighbourhood, word)

##############################################################################
# 08. Filter the dataset abb_count, overwritting the results of abb_count,
# to include only those words that are mentioned at least 500 times.

abb_count <- filter(abb_count, n > 500)

##############################################################################
# 09. Now, join the dataset `meta` the dataset `abb_count`, overwritting
# `abb_count`:

abb_count <- left_join(abb_count, meta)

##############################################################################
# 10. Finally, draw a map showing the most common words in each neighbourhood
# at the centered at the neighbourhood center. Use geom_text_repel to make
# this look nice.

qplot(lon, lat, data = abb_count, label = word) +
  geom_text_repel()

##############################################################################
# 10. Time remaining, try to repeate the prior plot using the ggmap package.
# If you were not here yesterday, look at lab07.

library(ggmap)
qmplot(lon, lat, data = abb_count, label = word) +
  geom_text_repel()





