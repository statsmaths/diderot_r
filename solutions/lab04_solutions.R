# Title: "Advanced graphics"
# Name:

# Load required functions and packages
library(tidyverse)
library(smodels)
library(forcats)
library(ggrepel)

theme_set(theme_minimal())

##############################################################################
# 01. Today's lab looks at a collection of breakfast cereals:

cereal <- read_csv("https://statsmaths.github.io/stat_data/cereal.csv")

# With variables:
#
#   name  - name of the specific cereal
#   brand - name of the cereal's manufacturer
#   sugar - amount of sugar per serving (g)
#   score - healthiness score; 0-100; 100 is the best
#   shelf - what shelf the cereal is typically stocked on in the store

##############################################################################
# 02. Produce a histogram of the sugar variable.

qplot(sugar, data = cereal)

##############################################################################
# 03. Draw a scatterplot of score and shelf.

qplot(shelf, score, data = cereal, alpha = I(0)) + geom_boxplot()

# Draw a boxplot of sugar and shelf.

qplot(shelf, sugar, data = cereal, alpha = I(0)) + geom_boxplot()

##############################################################################
# 04. If I want a healthy but reasonably sweet cereal which shelf would be the
# best to look on?

# Answer: The bottom and top shelves have similar healthiness score, but the
# bottom has sweeter cereals, so the bottom shelf is your best bet.

##############################################################################
# 05. I want to add labels to the plot, but there are too many cereals to have
# room to label all of them. Suppose I just want to look at General Mills
# cereals. I could use the function `filter` to create a new dataset that
# includes only these cereals:

general_mills <- filter(cereal, brand == "General Mills")

# Construct a dataset named `middle` that contains only those cereals in the
# middle shelf:

middle <- filter(cereal, shelf == "middle")

##############################################################################
# 06. Plot sugar (x-axis) against score (y-axis) for just those cereals in the
# middle shelf:

qplot(sugar, score, data = middle)

##############################################################################
# 07. Modify the previous plot to include nicer labels and a title:

qplot(sugar, score, data = middle) +
  xlab("Sugar content (grams per serving)") +
  ylab("Healthiness Score (0-100)") +
  ggtitle("Middle Shelf Cereals")

##############################################################################
# 08. Add a regression line to the previous plot using the command:
# geom_smooth(method = "lm")

qplot(sugar, score, data = middle) +
  geom_smooth(method = "lm") +
  xlab("Sugar content (grams per serving)") +
  ylab("Healthiness Score (0-100)") +
  ggtitle("Middle Shelf Cereals")

##############################################################################
# 09. Create a new plot of sugar (x-axis) against score (y-axis) from the
# entire dataset. Make all of the General Mills cereals orange.

qplot(sugar, score, data = cereal) +
  geom_point(data = general_mills, color = "orange")

##############################################################################
# 10. Make the previous plot nicer: add labels, make the non-GM cereals have
# an alpha value of 0.5, and label the GM cereals with their names:

qplot(sugar, score, label = name, data = cereal) +
  geom_point(data = general_mills, color = "orange") +
  geom_text_repel(data = general_mills)

##############################################################################
# 11. Now draw a sugar v. score plot, but add one smoothing line for all of
# the cereals and another for just the GM cereals. Make sure to use color so
# that the two lines can be differentiated.
#
# Note: We have not seen exactly how to do this, but it just involves putting
# pieces together that we have already explored.

qplot(sugar, score, data = cereal) +
  geom_smooth(method = "lm") +
  geom_smooth(data = general_mills, method = "lm", color = I("red"))

##############################################################################
# 12. Make one other advanced graphic that uses something new you learned
# today.




