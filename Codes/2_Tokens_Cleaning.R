library(quanteda)
library(ggplot2)
library(tidyverse)
library(wordcloud2)

set.seed(27)

# Initial Anlysis of Unigrams----
unigrams <- tokens(df$vid_title, what = "word",
                   remove_numbers = TRUE, remove_punct = TRUE,
                   remove_symbols = TRUE, remove_hyphens = TRUE)

# Add some kind of measure to how much emojis they put on tittles.

# Removal of emojis and wierd words
unigrams <- tokens_select(unigrams, "â", selection = 'remove')
unigrams <- tokens_select(unigrams, "ðÿ", selection = 'remove')

unigrams <- tokens_replace(unigrams, "w", "with")
unigrams <- tokens_replace(unigrams, "ep", "episode")

# With video game tittles
unigrams_dfm = dfm(unigrams, tolower = TRUE, stem = FALSE, remove = stopwords())
unigrams_m = as.matrix(unigrams_dfm)

incompleted_cases = which(!complete.cases(unigrams_m))
unigrams_m[incompleted_cases,] <- rep(0.0,ncol(unigrams_m))
rm('incompleted_cases')

#Freq table
v = rowSums(t(unigrams_m)) %>%
  sort(decreasing = TRUE)

word_freq_unis = data.frame(word = names(v),freq=v)

# Without video game tittles
unigrams_nogames <- tokens_select(unigrams, "fortnite", selection = 'remove')
unigrams_nogames <- tokens_select(unigrams_nogames, "minecraft", selection = 'remove')
unigrams_nogames <- tokens_select(unigrams_nogames, "roblox", selection = 'remove')
unigrams_nogames <- tokens_select(unigrams_nogames, "apex", selection = 'remove')
unigrams_nogames <- tokens_select(unigrams_nogames, "royale", selection = 'remove')
unigrams_nogames <- tokens_select(unigrams_nogames, "legends", selection = 'remove')
unigrams_nogames <- tokens_select(unigrams_nogames, "warfare", selection = 'remove')
unigrams_nogames <- tokens_select(unigrams_nogames, "modern", selection = 'remove')
unigrams_nogames <- tokens_select(unigrams_nogames, "pokemon", selection = 'remove')
unigrams_nogames <- tokens_select(unigrams_nogames, "madden", selection = 'remove')
unigrams_nogames <- tokens_select(unigrams_nogames, "nba", selection = 'remove')
unigrams_nogames <- tokens_select(unigrams_nogames, "gta", selection = 'remove')
unigrams_nogames <- tokens_select(unigrams_nogames, "league", selection = 'remove')
unigrams_nogames <- tokens_select(unigrams_nogames, "rainbow", selection = 'remove')
unigrams_nogames <- tokens_select(unigrams_nogames, "six", selection = 'remove')
unigrams_nogames <- tokens_select(unigrams_nogames, "siege", selection = 'remove')
unigrams_nogames <- tokens_select(unigrams_nogames, "hermitcraft", selection = 'remove')
unigrams_nogames <- tokens_select(unigrams_nogames, "rust", selection = 'remove')
unigrams_nogames <- tokens_select(unigrams_nogames, "uhc", selection = 'remove')

unigrams_dfm_nogames = dfm(unigrams_nogames, tolower = TRUE, stem = FALSE, remove = stopwords())
unigrams_m_nogames = as.matrix(unigrams_dfm_nogames)

v = rowSums(t(unigrams_m_nogames)) %>%
  sort(decreasing = TRUE)

word_freq_nogames = data.frame(word = names(v),freq=v)
rm('v')
