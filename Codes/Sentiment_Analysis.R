library(dplyr)
library(tidyr)
library(tidytext)
library(ggplot2)

# A little check
unigrams_tidy %>%
  count(term, sort = TRUE)

# We are goin to try 3 sentiment dictionaries

sentiment_afinn <-  unigrams_tidy_nogames %>%
  inner_join(get_sentiments("afinn")) %>%
  group_by(document) %>%
  mutate(document_netvalue = sum(value)) %>%
  count(document,document_netvalue) %>%
  ungroup() %>%
  mutate(totalmean = mean(document_netvalue)) %>%
  mutate(posdummy = ifelse(document_netvalue >= 0,1,0)) %>%
  group_by(posdummy) %>%
  mutate(sentimentmean = mean(document_netvalue)) %>%
  ungroup() %>%
  mutate(document = as.character(document))


sentiment_afinn %>%
  sample_frac(.9) %>%
  ggplot(aes(document,document_netvalue, fill = as.factor(posdummy))) +
  geom_col(show.legend = FALSE) +
  scale_fill_manual(values=c("#993333", "#0066CC")) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())


unigrams_tidy_nogames %>%
  inner_join(get_sentiments("nrc")) %>%
  filter(sentiment != "disgust") %>%
  count(word, sentiment, sort = TRUE) %>%
  group_by(sentiment) %>%
  top_n(5) %>%
  ungroup() %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n, fill = sentiment)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~sentiment, scales = "free_y") +
  labs(y = "Contribution to sentiment",
       x = NULL) +
  coord_flip()
