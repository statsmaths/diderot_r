# Title: "Spatial data"
# Name:

# Load required functions and packages
library(tidyverse)
library(smodels)
library(forcats)
library(ggrepel)
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

qplot(hollande, hollande_2, data = france) +
  geom_abline(slope = 1, intercept = 0)

# Did he always gain more votes in the second round?

##############################################################################
# 03. Now, plot Sarkozy's votes in the first round against his votes from the
# second round. Did he always gain more votes in the second round?

qplot(sarkozy, sarkozy_2, data = france) +
  geom_abline(slope = 1, intercept = 0)

# Did he always gain more votes in the second round?

##############################################################################
# 04. Plot the latitude (y-axis) and longitude (x-axis) of the departements,
# coloring the points based on whether hollande_2 is over 50 (in other words,
# show were Hollande won). You may wish to make the points a bit larger to
# make it easier to see the patterns.

qplot(lon, lat, data = france, color = (hollande_2 > 50))

##############################################################################
# 05. Reproduce the scatter plot, but now add geom_text_repel to label the
# points. Describe any geographic patterns you see. What are the two points
# in the lower right-hand side of the plot? Point to where Germany, Italy,
# and Spain are on the map.

qplot(lon, lat, data = france, color = (hollande_2 > 50), label = departement) +
  geom_text_repel()

##############################################################################
# 06. It would be great to add an actual map to this data. We can do that
# with the ggmap package. Replace the function "qplot" in question 04 to the
# function "qmplot" and see what happens:

qmplot(lon, lat, data = france, color = (hollande_2 > 50), label = departement)

##############################################################################
# 07. There are several options that we can give to qmplot that will improve
# the plot. Add the option 'legend = "topleft"' to put the legend inside of
# the plot.

qmplot(lon, lat, data = france, color = (hollande_2 > 50), label = departement,
       legend = "topleft")

##############################################################################
# 08. Now, set 'maptype = "toner-background"' to change the basemap:

qmplot(lon, lat, data = france, color = (hollande_2 > 50), label = departement,
       legend = "topleft", maptype = "toner-background")

##############################################################################
# 09. It would be nice to change the labels to be something more interesting.
# To do this, we'll create a new variable using the function 'ifelse':

france <- mutate(france, winner = ifelse(hollande_2 > 50, "Hollande", "Sarkozy"))

# Now, redo the plot with this variable:

##############################################################################
# 10. Now, for something more interesting, let's download the airbnb data for
# the city of Paris:

airbnb <- read_csv("https://statsmaths.github.io/stat_data/paris_airbnb.csv")
airbnb <- read_csv("~/Downloads/paris_airbnb.csv")


# The variables we need should be fairly self-explanatory.

##############################################################################
# 11.

qmplot(longitude, latitude, data = airbnb, legend = "none", alpha = I(0.01),
       color = I("orange"))




temp <- filter(airbnb, neighbourhood == "Reuilly")
qmplot(longitude, latitude, data = temp, legend = "topleft", color = room_type)

temp <- filter(airbnb, host_name %in% c("Nicolas", "Marie", "Sophie", "Pierre"))
qmplot(longitude, latitude, data = temp, legend = "topleft", color = I("orange")) +
  facet_wrap(~host_name)


Nicolas

temp <- mutate(airbnb, flag = grepl("Gare de Lyon", name))


temp <- filter(airbnb, grepl("Eiffel Tower", name, ignore.case = TRUE))
qmplot(longitude, latitude, data = temp, legend = "topleft", color = I("orange"))

temp <- filter(airbnb, grepl("tour eiffel", name, ignore.case = TRUE))
qmplot(longitude, latitude, data = temp, legend = "topleft", color = I("orange"))

temp <- filter(airbnb, grepl("central paris", name, ignore.case = TRUE))
qmplot(longitude, latitude, data = temp, legend = "topleft", color = I("orange"))

temp <- filter(airbnb, grepl("Champs Elysees", name, ignore.case = TRUE))
qmplot(longitude, latitude, data = temp, legend = "topleft", color = I("orange"))


temp <- filter(airbnb, grepl("Sacré Coeur", name, ignore.case = TRUE))
qmplot(longitude, latitude, data = temp, legend = "topleft", color = I("orange"))

temp <- filter(airbnb, grepl("Sacré Cœur", name, ignore.case = TRUE))
qmplot(longitude, latitude, data = temp, legend = "topleft", color = I("orange"))


temp <- filter(airbnb, grepl("Oberkampf", name, ignore.case = TRUE))
qmplot(longitude, latitude, data = temp, legend = "topleft", color = I("orange"))



