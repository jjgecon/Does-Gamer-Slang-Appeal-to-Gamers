library(tm)
library(tidytext)
library(dplyr)
library(stringr)

unigrams_tidy = tidy(unigrams_dfm)
colnames(unigrams_tidy) = c('document',"word", "count")
unigrams_tidy_nogames = tidy(unigrams_dfm_nogames)
colnames(unigrams_tidy_nogames) = c('document',"word", "count")
# Check for proper transformation
# this is the word freq
unigrams_tidy %>%
  count(term, sort = TRUE)

unigrams_tidy_nogames %>%
  count(term, sort = TRUE)
