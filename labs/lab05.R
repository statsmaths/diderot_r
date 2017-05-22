# Title: "Data manipulation"
# Name:

# You will need to run this (just once):
install.packages("devtools")
devtools::install_github("statsmaths/smodels")

# Alternatively, you can just run these function
# in R directly (because I know some people are
# having trouble with packages / internet here).
group_summarize <- function(.data, ...) {

  require("dplyr")
  data <- group_by_(.data, .dots = lazyeval::lazy_dots(...))
  group_vars <- sapply(attributes(data)$vars, as.character)

  data <- select_if(data, is.numeric)
  results <- summarize_all(data, funs(mean, median, sd, sum))

  if (ncol(data) <= length(group_vars) + 1) {
    these <- (names(results) %in% group_vars)
    names(results)[!these] <- paste0(setdiff(names(data),group_vars),
        "_", names(results)[!these])
  }

  results$n <- summarize(data, n = n())$n
  ungroup(results)
}

bin <- function(x, n) {

  breaks <- quantile(x, probs = seq(0, 1, length.out = n + 1),
                     na.rm = TRUE)
  cut(x, breaks, include.lowest = TRUE)

}

# Load required functions and packages
library(tidyverse)
library(ggrepel)
library(smodels)

theme_set(theme_minimal())

##############################################################################
# 01. Today, we will again be working with the cancer incidence data:

cancer <- read_csv("https://statsmaths.github.io/stat_data/cancer_inc_data.csv")

#  name       - the name of the county, parish, or census area
#  state      - two letter abbreviation of the state
#  breast     - incidence rate per 100,000 women over 18 years of age
#  colorectal - incidence rate per 100,000 adults over 18 years of age
#  prostate   - incidence rate per 100,000 men over 18 years of age
#  lung       - incidence rate per 100,000 men over 18 years of age
#  melanoma   - incidence rate per 100,000 men over 18 years of age
#  poverty    - percentage of households below the poverty line
#  income     - median household income
#  region     - the state's region of the country from 9 possible categories
#  lat        - decimal latitude of the county centroid
#  lon        - decimal longitude of the county centroid

##############################################################################
# 02. Draw a plot of state (x-axis) against breast cancer incidence (y-axis):



##############################################################################
# 03. It would be great if we could grab summary statistics from this
# plot for each state and save it quickly as a single dataset. This would, for
# example let us plot the typical povery level and typical incidence rate for
# each state on a single plot. Otherwise, we would have to do something like
# this:

temp <- filter(cancer, state == "al")
mean(temp$breast)
mean(temp$poverty)

# And so on for other functions, cancer types and states. What a pain! I've
# written a simple wrapper to make this easier called `group_summarize`.
# Calling this over `cancer` without any other options returns a data set
# with the mean, median, standard deviation, and sum for each variable, as
# well as a count variable called "n". Run this code and look at the the
# result in the data viewer:

temp <- group_summarize(cancer)

##############################################################################
# 04. Once you are comfortable with that output, let's add another option to
# group summarize. By specifying a variable name, the function will compute
# each of the same summaries, but this time *within* in each group rather
# than over the entire dataset:



# Take another look at the data in the data viewer. Try sorting by lung_mean;
# which state has the highest average lung cancer incidence rate? Which has
# the lowest average?

# Answer:

##############################################################################
# 05. Modify the code from the previous question to summarize the dataset at
# the region level. Draw a scatter plot of the variables income_mean and
# lung_mean and label the points based on the region name.



# Describe the plot in a couple of sentences.

# Answer:

##############################################################################
# 06. It is sometimes useful to construct new variables based on other
# variables in our dataset. For example, we might want to add a variable
# `total` to the cancer data giving the sum of the five cancer types. To
# do this we use the `mutate` function:



# Notice that the second argument is named whatever I want the new variable
# to be called (total, in this case). I could have named it any single word
# I desired.
#
# Also notice that I saved the result back as the original dataset `cancer`.
# Because I am only adding things to the dataset, there is no need to give
# the output a new name.

##############################################################################
# 07. Add a new variable called lung_percentage to `cancer` giving the percent
# of cancer cases (from these five types at least) attributed to lung cancer
# in each county.



##############################################################################
# 08. Draw a scatter plot of the cancer dataset with lon and lat, coloring the
# points based on `lung_percentage` coded binned into 4 buckets. Describe
# where the lowest and highest percentages are in the country.



# Answer:

##############################################################################
# 09. Summarize the cancer dataset at the state level and plot the mean
# latitude variable (x-axis) versus the mean melanoma variable (y-axis).




# What appears to be the relationship between the two variables?

# Answer:

##############################################################################
# 10. Add a regression line to the previous plot.



# Does the slope of the line coincide with the relationship you observed in
# the previous question?

# Answer:

##############################################################################
# 11. You should see that the melanoma incidence increases with latitude. Does
# this seam intuitive or counterintuitive?

# Answer:

##############################################################################
# 12. There are four outlying points. Label the states with geom_text_repel



# What state has the highest melanoma incidence? Which has the lowest melanoma
# incidence rate?

# Answer:

##############################################################################
# 13. (Critical Thinking) Based on this analysis, explain why the melanoma
# rate increases with latitude:

# Answer:

##############################################################################
# 14. (Practice) We have covered several new functions here and I want to
# make sure it sinks in. Read the diamonds dataset in again:

diamonds <- read_csv("https://statsmaths.github.io/stat_data/diamonds.csv")

##############################################################################
# 15. The group_summarize function can summarize by multiple variables at the
# same time. Construct a dataset named `temp` that is group summarized by
# color and clarity:



# Look at the results to understand what happens when you summarize by
# multiple variables simultaneously.

##############################################################################
# 16. Using the summarized data, plot `carat_mean` vs. `price_mean`, coloring
# the points by the clarity.



# Describe the relationship mean the (mean) weight and (mean) price. Does the
# relationship seem to depend on the clarity? How?

# Answer:

##############################################################################
# 17. Repeat the prior question, but color the points based on the color of
# the diamond.



# Does this plot help to explain any outliers in the carat vs. price plot?

# Answer:

##############################################################################
# 18. We will also apply these techniques to a collection of tea's for sale
# online (see adagio.com):

tea <- read_csv("https://statsmaths.github.io/stat_data/tea.csv")

# With variables:
#   name  - the full name of the tea
#   type  - the type of tea. One of:
#
#               - black
#               - chai
#               - decaf
#               - flavors
#               - green
#               - herbal
#               - masters
#               - matcha
#               - oolong
#               - pu_erh
#               - rooibos
#               - white
#
#   score       - use rated score; from 0 to 100
#   price       - estimated price of one cup of tea
#   num_reviews - total number of online reviews

##############################################################################
# 19. Create a dataset named `temp` that consists of only white teas.



##############################################################################
# 20. Draw a scatter plot of all of the teas with num_reviews (x-axis) against
# score (y-axis). Color all of the white teas in red and label them with the
# tea name using geom_text_repel.



##############################################################################
# 21. Summarize the dataset by the type of tea and save the results as a
# variable named `temp`.


##############################################################################
# 22. Plot the average price (x-axis) against the average score (y-axis) of
# each type  of tea. Make the size of the points proportional to the number
# of teas in each category and label the points with geom_text_repel and the
# tea type.



