library(quanteda)
library(ggplot2)
library(tidyverse)
library(wordcloud2)

unigrams_tf = apply(unigrams_m,1,TF)
unigrams_idf = apply(unigrams_m,2,IDF)
unigrams_tfidf = apply(unigrams_tf,2,TF_IDF,
                       idf = unigrams_idf)

incompleted_cases = which(!complete.cases(t(unigrams_tfidf)))

unigrams_tfidf = t(unigrams_tfidf)

unigrams_tfidf[incompleted_cases,] <- rep(0.0,ncol(unigrams_tfidf))

unigrams_tfidf = t(unigrams_tfidf)

tfidf = sort(apply(unigrams_tfidf,1,mean),decreasing = TRUE)
word_tfidf = data.frame(freq=tfidf)
word_tfidf = data.frame(word = rownames(word_tfidf), freq=tfidf)
head(word_tfidf,30)

rm('unigrams_tf','unigrams_idf','unigrams_tfidf')

# Removing some game tittles
#
unigrams_tf_nogames = apply(unigrams_m_nogames,1,TF)
unigrams_idf_nogames = apply(unigrams_m_nogames,2,IDF)
unigrams_tfidf_nogames = apply(unigrams_tf_nogames,2,TF_IDF,
                               idf = unigrams_idf_nogames)

incompleted_cases = which(!complete.cases(t(unigrams_tfidf_nogames)))

unigrams_tfidf_nogames = t(unigrams_tfidf_nogames)

unigrams_tfidf_nogames[incompleted_cases,] <- rep(0.0,ncol(unigrams_tfidf_nogames))

unigrams_tfidf_nogames = t(unigrams_tfidf_nogames)

tfidf_nogames = sort(apply(unigrams_tfidf_nogames,1,mean),decreasing = TRUE)
word_tfidf_nogames = data.frame(freq=tfidf_nogames)
word_tfidf_nogames = data.frame(word=rownames(word_tfidf_nogames),freq=tfidf_nogames)
head(word_tfidf_nogames,30)

rm('incompleted_cases', 'tfidf','tfidf_nogames')
rm('unigrams_tf_nogames','unigrams_idf_nogames','unigrams_tfidf_nogames')
rm('unigrams_m','unigrams_m_nogames','unigrams_dfm','unigrams_dfm_nogames')
