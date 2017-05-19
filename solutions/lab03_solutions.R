# Title: "Fast Cars and Fancy Diamonds"
# Name:

# Load required functions and packages
library(tidyverse)
library(smodels)
library(forcats)
library(ggrepel)

theme_set(theme_minimal())

##############################################################################
# 01. We are going to look at two datasets in this lab. The first contains
# information about a set of automobiles. To read it in we use the `read_csv`
# function as usual:

mpg <- read_csv("https://statsmaths.github.io/stat_data/mpg.csv")

# The variables in the dataset are:
#
#   manufacturer - name of the car's manufacturer
#   model        - name of the car model
#   displ        - the car's engine size, in litres
#   year         - year model year
#   cyl          - number of cylinders in the engine
#   trans        - transmition type
#   drv          - is the car 4 wheel drive ("4"), front wheel drive ("f") or
#                  rear wheel drive ("r")
#   cty          - number of miles you would expect to get for each gallon of
#                  fuel in a city environment
#   hwy          - number of miles you would expect to get for each gallon of
#                  fuel on the highway
#   fl           - fuel type
#   class        - type of car class

##############################################################################
# 02. Construct a scatter plot to describe the relationship between engine
# size and `cty`.

qplot(displ, cty, data = mpg)

# Describe the relationship you see in the plot.

# Answer: Larger engines have, in general, worse fuel efficiency.

##############################################################################
# 03. Modify the previous plot to change the color of the points based on the
# class of car.

qplot(displ, cty, data = mpg, color = class)

# Pick out 2 classes of cars. Does there placement on the plot seem as you
# would have expected?

# Answer:

##############################################################################
# 04. Modify the previous plot so that the color is defined by the variable
# cyl. Then produce the same plot colored by `cyl` treated as a categorical
# variable using the function `factor`.

qplot(displ, cty, data = mpg, color = cyl)
qplot(displ, cty, data = mpg, color = factor(cyl))

# Describe some patterns you see in the data.

# Answer: Compact and sub-compact cars have small engines and good fuel
# efficiency, both as we might effect. Two-seater and SUVs have large engines,
# in the first case because these are sports cars and the second are just
# large, and bad fuel efficiency. The other types fall somewhere in between
# these extremes, also as expected.

##############################################################################
# 05. Modify the previous plot so that the color is defined by the variable
# `hwy`. Then produce the same plot colored by `hwy` treated as a categorical
# variable using `factor`.

qplot(displ, cty, data = mpg, color = hwy)
qplot(displ, cty, data = mpg, color = factor(hwy))

# Which plot do you find more useful?

# Answer: I find the second much easier to interpret and use.

##############################################################################
# 06. Modify the previous plot so that the color is defined by `hwy` bucketed
# into 10 classes using the `cut` function.

qplot(displ, cty, data = mpg, color = cut(hwy, 10))

##############################################################################
# 07. Now for something new. We've seen how to add a line plot to our chart;
# now we will add a smoothing curve to the plot. Plot `displ` (x-axis) and
# `cty` (y-axis) but change the geom to "smooth".

qplot(displ, cty, data = mpg) + geom_smooth()

# Describe what this type of plot is doing.

# Answer: It is adding a curve to the plot that tries to pass as close as
# possible to all of the points.

##############################################################################
# 08. Another very useful geometry is call simply "text". Try running the
# following line of code:

qplot(displ, cty, data = mpg) + geom_text()

# What error message do you get?

# Answer: "Error: geom_text requires the following missing aesthetics: label"

# Add the input parameter label = model to fix the error message.

qplot(displ, cty, data = mpg, label = model) + geom_text()

##############################################################################
# 09. What model has the highest city fuel efficiency? Which one has the
#  largest engine? Why are their duplicate model names in the dataset?

# Answer: The New Beetle has the best efficiency and a corvette has the
# largest engine. There are duplicates because there are multiple model years
# in the dataset.

##############################################################################
# 10. We have seen how `cut` and `factor` can be used to convert a numeric
# vector to a categorical one. The function `paste` works similarly, but
# takes two or more variables and combines them as strings into one. Run,
# for example, the following:

qplot(displ, cty, data = mpg, label = paste(model, year), alpha = I(0)) + geom_text()

# Notice that `year` gets seamlessly translated into a character variable
# and that both are literally "pasted" together in the output.

##############################################################################
# 11. Using the new plot, be more specific about the car with the highest city
# fuel efficiency. Be more specific about the car with the largest engine.

# Answer: The 1999 New Beetle has the best efficiency and the 2008 Corvette
# has the largest engine.

##############################################################################
# 12. Let's apply these techniques with a little less hand-holding to a new
# set of data. Read in the diamonds dataset, which gives metadata for a set
# of 1000 diamonds

diamonds <- read_csv("https://statsmaths.github.io/stat_data/diamonds_small.csv")

# The variable names are:
#
#   price   - price in US dollars (\$326-\$18,823)
#   carat   - weight of the diamond (0.2-5.01)
#   cut     - quality of the cut (Fair, Good, Very Good, Premium, Ideal)
#   color   - diamond colour, from J (worst) to D (best)
#   clarity - a measurement of how clear the diamond is (I1 (worst),
#             SI1, SI2, VS1, VS2, VVS1, VVS2, IF (best))
#   x       - length in mm (0-10.74)
#   y       - width in mm (0-58.9)
#   z       - depth in mm (0-31.8)
#   depth   - total depth percentage = z / mean(x, y) = 2 * z / (x + y)
#   table   - width of top of diamond relative to widest point

##############################################################################
# 13. Draw a scatter plot with `carat` on the x-axis and `price` on the
# y-axis.

qplot(carat, price, data = diamonds)

# Describe the pattern.

# Answer: Larger diamonds tend to be more expensive. Also, diamonds tend to be
# cut to be just larger than a whole number of carats

##############################################################################
# 14. Add the "smooth" geometry to the plot.

qplot(carat, price, data = diamonds) + geom_smooth()

##############################################################################
# 15. Draw a scatterplot of carat (x-axis) against price (y-axis) the color
# of based on the variable `x` cut into 5 buckets.

qplot(carat, price, data = diamonds, color = cut(x, 5))

# Describe the relationship between `x` and the other two variables in the
# plot.

# Answer: The length of the diamond (x) seems to increase along with the
# overall weight of the diamond.

##############################################################################
# 16. Use `qplot` to draw a barplot of the clarity types.

qplot(clarity, data = diamonds)

# Which clarity type has the largest number of diamonds in the data set? Why
# do you think this is given the clarity chart shown in question 13?

# Answer: SI1. It is one of the poorest clarities, and hence more common, but
# not the worst on the scale; the worst is probably used mostly in industry
# applications.

# Which clarity type has the smallest number of diamonds in the data set? Why
# do you think this is given the clarity chart shown in question 13?

# Answer: The lowest type is I1, the worst clarity value. Most of these are
# probably not suited to jewelery.

##############################################################################
# 17. Draw a plot with `carat` on the x-axis and `price` on the
# y-axis use the `text` geom with labels from the clarity variable.

qplot(carat, price, data = diamonds, label = clarity) + geom_text()

# What clarity types does the most expensive diamond have? Does this surprise
# you at all?

# Answer: The most expensive diamonds is VS1. This is a little surprising as
# this is only a mid-range diamond and is not particularly large. (I think it
# has exceptional color, though).

# What clarity type does the largest diamond have? Does this surprise you at
# all?

# Answer: The largest diamond is SI1. This seems reasonable as it is the most
# common and second-least clear diamond. It would make sense that the larger
# diamonds are less likely they are to be clear.

