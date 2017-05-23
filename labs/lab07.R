# Title: "Spatial data"
# Name:

# You will need to install the ggmap package,
# which can be done with this line:
install.packages("ggmap")

# It is possible that you will run into errors,
# this is fairly well-known problem that should
# really have been fixed by now. You can try
# to do this:
install.packages("devtools")
devtools::install_github("dkahle/ggmap")
devtools::install_github("hadley/ggplot2@v2.2.0")​

# Load required functions and packages
library(ggplot2)
library(dplyr)
library(readr)
library(smodels) # or functions from lab06.R
library(ggmap)

theme_set(theme_minimal())

##############################################################################
# 01. The data for this lab comes from the 2012 French Presidential election
# (I have not yet updated from this year). As I am sure you already know:
# In France, the presidential election has two stages. In the first round,
# there are many candidates on the ballot and voters choose their single
# favorite from the entire pool. The top two candidates from the first round
# then move onto the second round. In the second round, voters choose between
# the remaining candidates and whomever gets the majority of the vote becomes
# president. (Technically, if someone has a majority in the first round,
# they can win outright, but this is relatively unlikely). In 2012, the
# incumbant Nicolas Sarkozy and François Hollande made it to the second
# round; Hollande ultimately won the presidency.

france <- read_csv("https://statsmaths.github.io/stat_data/french_election_2012.csv")

# Our dataset shows results from both stages of the election, given as a
# proportion of support within each département. What we are interested in
# studying is how votes shifted from the first stage to the second stage.
# All of the values in the dataset are proportions from the first stage,
# except for the last two columns which show results from the second stage.

##############################################################################
# 02. Plot Hollande's votes from the first round against his votes from the
# second round (second on the y-axis).



# Did he always gain more votes in the second round?

##############################################################################
# 03. Now, plot Sarkozy's votes in the first round against his votes from the
# second round. Did he always gain more votes in the second round?



# Did he always gain more votes in the second round?

##############################################################################
# 04. Plot the latitude (y-axis) and longitude (x-axis) of the departements,
# coloring the points based on whether hollande_2 is over 50 (in other words,
# show were Hollande won). You may wish to make the points a bit larger to
# make it easier to see the patterns.



##############################################################################
# 05. Reproduce the scatter plot, but now add geom_text to label the
# points. Describe any geographic patterns you see. What are the two points
# in the lower right-hand side of the plot? Point to where Germany, Italy,
# and Spain are on the map.



##############################################################################
# 06. It would be great to add an actual map to this data. We can do that
# with the ggmap package. Replace the function "qplot" in question 04 with the
# function "qmplot" and see what happens:




##############################################################################
# 07. There are several options that we can give to qmplot that will improve
# the plot. Add the option 'legend = "topleft"' to qmplot to put the legend
# inside of the plot.




##############################################################################
# 08. Now, set 'maptype = "toner-background"' to change the basemap:




##############################################################################
# 09. It would be nice to change the labels to be something more interesting.
# To do this, we'll create a new variable using the function 'ifelse':

france <- mutate(france, winner = ifelse(hollande_2 > 50, "Hollande", "Sarkozy"))

# Now, redo the plot with this variable:



##############################################################################
# 10. Now, for something more interesting, let's download the airbnb data for
# the city of Paris:

airbnb <- read_csv("https://statsmaths.github.io/stat_data/paris_airbnb.csv")

# The variables we need should be fairly self-explanatory.

##############################################################################
# 11. Plot a map of Paris showing where all of the airbnb listings are
# located. Try to adjust the size and/or opacity of the points in order to
# make the map more readable.



##############################################################################
# 12. Now, create a new dataset called reuilly consisting of only listings in
# the Reuilly neighbourhood.

temp <- filter(airbnb, neighbourhood == "Reuilly")

# Plot this dataset over a map.



# What do you notice about the way airbnb defined neighborhoods?

# Answer:

##############################################################################
# 13. As a look forward to text processing tomorrow, let's make use of the
# grepl function. It returns TRUE if an input is found as a subtring of a
# larger vector and FALSE otherwise. For example, notice what happens in the
# following code:

people <- c("Taylor Arnold", "Paula Lissón", "Mickey Mouse", "Arnold Schwarzenegger")
grepl(people, "Arnold")
grepl(people, "a")
grepl(people, "arnold", ignore.case = TRUE)

##############################################################################
# 14. The grepl function is very useful to use in combination with the filter
# function. For example, we can create a temporary dataset named `temp` that
# contains only those listing mentioning the Champs Elysees:

temp <- filter(airbnb, grepl("Champs Elysees", name, ignore.case = TRUE))

# Instead, create a dataset that only contains those listing mentioning the
# Eiffel Tower. Plot these listings and decribe where they are in the city.



# Answer:

##############################################################################
# 15. Repeat the previous question but instead find listings that reference
# the "Tour Eiffel". Does this distribution differ from the English name?



##############################################################################
# 16. Time permitting, try to find some other interesting patterns in the
# data set (I am sure there are MANY).

