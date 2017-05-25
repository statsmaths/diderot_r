# Title: "Strings in R"
# Name:

# You will need to install these packages if you
# not already done so
install.packages("stringr")
install.packages("dplyr")
install.packages("ggplot2")

# Now load them in:
library(stringr)
library(dplyr)
library(ggplot2)

theme_set(theme_minimal())

##############################################################################
# 01. For this lab, you are going to grab the dataset you would like to look
# at directly from Wikipedia. Set the url below the page you are interested
# in, for example here is the page on R (use whatever you want, but make
# sure it is a longer article or the results will be less interesting)

url <- "https://en.wikipedia.org/wiki/R_(programming_language)"

# Then run the following line to read the webpage in line by line and
# store it in a data frame named wpage:

wpage <- data_frame(line = readLines(url))

##############################################################################
# 02. Open the dataset in the data viewer. What is going on in the first few
# dozen lines? Can you find where the actual text starts looking at the
# data directly?

# Answer:

##############################################################################
# 03. A good heuristic for finding lines that actually contain text, rather
# than code, menus, and sidebars, is to look for the HTML tag <p>. Create
# new dataset named wpage_p where you filter only those lines containing
# the string "<p>". Make sure to use the stringr functions!

wpage_p <- filter(wpage, str_detect(line, "<p>"))

# How many lines is this dataset compared to the raw HTML file?

# Answer:

##############################################################################
# 04. In HTML, the tag <a> represent a link to another page. Add a variable
# `num_tags` to the dataset wpage_p that counts how many times the string "<a"
# occurs in each line. Note: Yes, we want to test for "<a" and NOT "<a>"
# because the tag will almost always include additional information inside
# the tag.

wpage_p <- mutate(wpage_p, num_tags = str_count(line, "<a"))

##############################################################################
# 05. Draw histogram of the number of links contained in each line. Does this
# distribution strike you as surprising at all (it may not)?

qplot(num_tags, data = wpage_p)

##############################################################################
# 06. Citations in Wikipedia occur between square braces, such as "[*]".
# Add an (approximate) count `num_cites` of the number of citations of each
# paragraph to the dataset by counting how many times the left "[" occurs.
# Note: you need to escape this as we did with the period, $, and ^.

wpage_p <- mutate(wpage_p, num_cites = str_count(line, "\\["))

##############################################################################
# 07. Now, use a stringr function to add a variable `num_char` describing how
# many characters each paragraph is to the data.

wpage_p <- mutate(wpage_p, num_char = str_length(line))

##############################################################################
# 08. Draw a scatter plot with a regression line showing the relationship
# between the number of characters in a sentence and the number of citations
# it has. Describe the pattern

qplot(num_char, num_cites, data = wpage_p) +
  geom_smooth(method = "lm")

##############################################################################
# 09. In the notes, I gave you the expression, "<[^>]+>", which matches
# anything in between html tags. Use this to construct a new variable
# `line_clean` that removes HTML tags from `line`:

wpage_p <- mutate(wpage_p, line_clean = str_replace_all(line, "<[^>]+>", ""))

##############################################################################
# 10. The regular expression "\\[[^]]+\\]" will similarly match the citations
# in the page. Remove these from line_clean as well:

wpage_p <- mutate(wpage_p, line_clean = str_replace_all(line_clean, "\\[[^]]+\\]", ""))

##############################################################################
# 11. The regular expression expression "[a-z]+" matches any number of
# non-capital letters. Use this to extract words w/o capital letters that
# proceed the word "is", saving it as a new variable `word`, from
# `line_clean`. Note: You'll probably only be able to do this approximately.

wpage_p <- mutate(wpage_p, word = str_extract(line_clean, " [a-z]+ is "))
wpage_p <- mutate(wpage_p, word = str_sub(word, 2, -5))
wpage_p$word

##############################################################################
# 12. The function str_c can collapse a vector into a single string. So, we
# can see all of the text by writing:

text <- str_c(wpage_p$line_clean, collapse = " ")

##############################################################################
# 13. We can save the text on your computer by running the following:

writeLines(text, "filename.txt")

# Do this, but replace the name "filename.txt" with something more descriptive
# given the page you looked at.

##############################################################################
# 14. If you have time remaining, try to do this again with a different page,
# ideally one at least roughly related to the first that you used.



