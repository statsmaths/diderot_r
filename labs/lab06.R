# Title: "Make your own data"
# Name:

# Load required functions and packages
library(tidyverse)
library(smodels)
library(forcats)
library(ggrepel)

theme_set(theme_minimal())

##############################################################################
# 01. Here you are going to construct your own dataset, read it into R, and
# practice plotting based on your data. Start by opening Excel (or Google
# docs, if you prefer). The first row of your file needs to contain the
# variable names, and each row gives the data for one observation of the data.
# We want the variable names to contain no spaces; I also prefer to use all
# lower case letters; seperate words with an underscore.

# I am open to anything you would enjoy contructing a small dataset with;
# the only rule is that you need at least 8 observations, two numerical
# variables, and two categorical variables. Here are some examples that you
# could use if nothing comes to mind:

# 1. Your favorite restaurants; record the name of the restaurant, the style
#    of restaurant, the price of a typical meal, average length of time spent
#    there in minutes

# 2. A dataset of your closest friends; give their name, where you met, their
#    approximate height in inches, how long you've known them for in years

# 3. Ten styles of beer; give the name, county of origin, typical ABV, and
#    how much you like it on a ten-point scale

# 4. A set of your favorite music artists/bands; write the name of the group,
#    the genre, the number of albums they have, the number of years they are/
#    were active

# Note: We are just doing this for illustration purposes, so don't obsess
# about having to guess some values. Just fill in something reasonable.

##############################################################################
# 02. Expore your dataset as a csv file and name it "data.csv". Place the
# file on the desktop. Clik on "Session -> Set Working Directory" and set it
# to your desktop. Now, read in your data using:

mydata <- read_csv("data.csv")

##############################################################################
# 03. Plot a histogram of on of the numeric variables. What appears to be a
# typical range of the variable?


# Answer:

##############################################################################
# 04. Plot a scatterplot with both numeric variables.


# Describe any noticable patterns, if there are any.

# Answer:

##############################################################################
# 05. Modify the previous plot so that all of the points are red.



##############################################################################
# 06. Modify the previous plot so that all of the points are green and 5 times
# larger than normal.



##############################################################################
# 07. Modify the previous plot so that all of the points are orange, 5 times
# larger than normal, and transparent (use any alpha level you find suitable).



##############################################################################
# 08. Plot a scatterplot of your two numeric variable, but make the color a
# function of on of the categorical variables.



##############################################################################
# 09. Describe one thing you would like to do to the plot that we do not yet
# have the tools for.

# Answer:

# NOTE: Make sure to upload your "data.csv" to Box in addition to the script!
