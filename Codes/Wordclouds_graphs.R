library(dplyr)
library(ggplot2)
library(wordcloud2)

# Common words vs tf_idf
show = 20

word_freq_unis[1:show,] %>%
  ggplot(aes(x=reorder(word,freq), y=freq)) + geom_bar(stat="identity", fill="springgreen4") +
  theme_minimal() + labs(y = "Frequency", x = "Words", title = "Most Used Words") + coord_flip()

word_tfidf[1:show,] %>%
  ggplot(aes(x=reorder(word,freq), y=freq)) + geom_bar(stat="identity", fill="darkcyan") +
  theme_minimal() + labs(y = "Frequency", x = "Words", title = "Most Important Words") + coord_flip()

word_freq_nogames[1:show,] %>%
  ggplot(aes(x=reorder(word,freq), y=freq)) + geom_bar(stat="identity", fill="red3") +
  theme_minimal() + labs(y = "Frequency", x = "Words", title = "Most Used Words No Game Tittles") + coord_flip()

word_tfidf_nogames[1:show,] %>%
  ggplot(aes(x=reorder(word,freq), y=freq)) + geom_bar(stat="identity", fill="darkviolet") +
  theme_minimal() + labs(y = "Frequency", x = "Words", title = "Most Important Words No Game Tittles") + coord_flip()

# Wordclouds
wordcloud2(word_freq_unis, minSize = 2, color = 'random-dark')
wordcloud2(word_freq_nogames, minSize = 2, color = 'random-dark')

rm('show')
