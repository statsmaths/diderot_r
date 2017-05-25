# Title: "cleanNLP: Part I"
# Name:

# Load core packages
library(stringr)
library(dplyr)
library(ggplot2)
library(readr)

theme_set(theme_minimal())

##############################################################################
# 01. The cleanNLP package gives us proper, modern NLP parsing functionality
# in R. The best way to install it at the moment is using the following code:

install.packages("tokenizers")
install.packages("devtools")
devtools::install_github("statsmaths/cleanNLP")

##############################################################################
# 02. The most basic usage of cleanNLP involves setting up the pipeline:

library(cleanNLP)
init_tokenizers()

# And the calling the function `run_annotators` on a vector of text. For example,
# here we do it the openning lines of Douglas Adam's Life, the
# Universe and Everything:

text <- c("The regular early morning yell of horror was the sound of",
          "Arthur Dent waking up and suddenly remembering where he",
          "was. It wasn't just that the cave was cold, it wasn't just",
          "that it was damp and smelly. It was the fact that the cave",
          "was in the middle of Islington and there wasn't a bus due",
          "for two million years.")
text <- paste(text, collapse = " ")

# And run the annotation:

obj <- run_annotators(text, as_strings = TRUE)

##############################################################################
# 03. The returned object contains a number of tables that contains normalized
# database tables. We can access a combined form of these by calling the
# function `get_token` with the following options:

anno <- get_token(obj, combine = TRUE, remove_na = FALSE)
anno

# Unfortunately, we initialized the tokenizers backend which support no
# annotators other than tokenization.

##############################################################################
# 04. The other two options we have are to initialize the coreNLP backend:

init_coreNLP()

# Or, the spaCy backend:

init_spaCy(model_name = "fr")

# Unfortunately, these both necessitate some non-trivial set-up. The first
# requires Java and the second a working version of Python... we won't have
# time to do this now but instructions are on the GitHub page:
#
#   https://github.com/statsmaths/cleanNLP
#
# In general, spaCy is not too hard to set-up on Mac or Linux but fairly
# difficult in Windows. CoreNLP is the other way around.

##############################################################################
# 05. We won't be able to fully annotate text from scratch, but at least you
# have all of the code now to do it. Here is what it looks like using a
# pre-annotated text that is contained in the cleanNLP package:

anno <- get_token(obama, combine = TRUE, remove_na = FALSE)
anno






