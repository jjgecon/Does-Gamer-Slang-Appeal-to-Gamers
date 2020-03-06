library(quanteda)
library(ggplot2)
library(tidyverse)
library(wordcloud2)

set.seed(27)

# Initial Anlysis of Unigrams----
unigrams <- tokens(df$vid_title, what = "word",
                   remove_numbers = TRUE, remove_punct = TRUE,
                   remove_symbols = TRUE, remove_hyphens = TRUE)

unigrams_dfm = dfm(unigrams, tolower = TRUE, stem = FALSE, remove = stopwords())
unigrams_m = as.matrix(unigrams_dfm)

v = rowSums(t(unigrams_m)) %>%
  sort(decreasing = TRUE)

word_freq_unis = data.frame(word = names(v),freq=v)
head(word_freq_unis,10)

word_freq_unis[1:10,] %>%
  ggplot(aes(x=reorder(word,freq), y=freq)) + geom_bar(stat="identity", fill="springgreen4") +
  theme_minimal() + labs(y = "Frequency", x = "Words", title = "Most Used Words") + coord_flip()

# Some cleaning ----
#
# In the 1st 100 words we have 2 tokens that are not really make any sense "â", "ðÿ" a lone "w"
head(word_freq_unis,100)

indexword = finder("â",unigrams_m)
head(indexword)

#Checking what are the cases of said â
df$vid_title[986]
df$vid_title[1039]
df$vid_title[1042]
# In all cases those seems to be emojis in the titles, so we can remove them
unigrams <- tokens_select(unigrams, "â", selection = 'remove')

indexword = finder("ðÿ",unigrams_m)
head(indexword)

df$vid_title[892]
df$vid_title[915]
# Again some emojis, specifically the crying emoji
unigrams <- tokens_select(unigrams, "ðÿ", selection = 'remove')

# uhc?
indexword = finder("uhc",unigrams_m)
head(indexword)
# It's a mincraft thing
# Need to be removed

indexword = finder("w",unigrams_m)
head(indexword)

df$vid_title[98]
df$vid_title[100]
# The lone w is similar to ft. Therefore we will not remove them
# We will change w to with
unigrams <- tokens_replace(unigrams, "w", "with")
# ep is short for episode
unigrams <- tokens_replace(unigrams, "ep", "episode")

# Final unigram without stemming database ----
unigrams_dfm = dfm(unigrams, tolower = TRUE, stem = FALSE, remove = stopwords())
unigrams_m = as.matrix(unigrams_dfm)

v = rowSums(t(unigrams_m)) %>%
  sort(decreasing = TRUE)

word_freq_unis = data.frame(word = names(v),freq=v)
head(word_freq_unis,30)

# Uni-Wordclouds

wordcloud2(word_freq_unis, minSize = 2, color = 'random-light',backgroundColor = "black")

# Asside from games, what are the main most popular words? ----
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

unigrams_dfm_nogames = dfm(unigrams_nogames, tolower = TRUE, stem = FALSE, remove = stopwords())
unigrams_m_nogames = as.matrix(unigrams_dfm_nogames)

v = rowSums(t(unigrams_m_nogames)) %>%
  sort(decreasing = TRUE)

word_freq_nogames = data.frame(word = names(v),freq=v)
head(word_freq_nogames,10)

word_freq_nogames[1:10,] %>%
  ggplot(aes(x=reorder(word,-freq), y=freq)) + geom_bar(stat="identity", fill="springgreen4") +
  theme_minimal() + labs(y = "Frequency", x = "Words", title = "Most Used Words")

wordcloud2(word_freq_unis, minSize = 2, color = 'random-light',backgroundColor = "black")
