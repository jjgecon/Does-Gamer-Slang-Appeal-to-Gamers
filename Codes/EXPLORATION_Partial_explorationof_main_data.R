library(ggplot2)

max(df$vid_views)
min(df$vid_views)

ggplot(data = subset(df, df$vid_views < mean(df$vid_views)), aes(x=vid_views)) + geom_histogram(bins = 50)
ggplot(data = subset(df, df$space_between_vids < 20), aes(x=space_between_vids)) + geom_histogram(bins = 20)
ggplot(data = subset(df, df$vid_views < mean(df$vid_views)), aes(x=vid_comments)) + geom_histogram(bins = 50)

df %>%
  subset(vid_views < mean(vid_views)) %>%
  ggplot(aes(x=vid_comments)) + geom_histogram(bins = 50)

df %>%
  ggplot(aes(x=vid_comments)) + geom_histogram(bins = 50)

df %>%
  ggplot(aes(x=vid_likes)) + geom_histogram(bins = 50)

max(df$vid_views)/max(df$vid_likes)
max(df$vid_dislikes)
max(df$vid_comments)
min(df$vid_comments)

quantile(df$vid_views, prob = seq(0, 1, length = 11), type = 5)

# Percentage of gamming videos
length(which(df$vid_category=="Gaming"))/length(df$vid_category)

df %>%
  subset(category_action_game == 1 & df$vid_views < mean(df$vid_views)) %>%
  ggplot(aes(x=vid_views)) + geom_histogram()

df %>%
  subset(category_rpg_game == 1 & df$vid_views < mean(df$vid_views)) %>%
  ggplot(aes(x=vid_views)) + geom_histogram()

summary(df)

# A Channel has zero subcribers as he hides them
View(df[which(df$subcriber_count == 0),])

# Related Topic Exploration
View(df[which(df$category_music_game == 1),])

View(df[which(df$vid_views == max(df$vid_views)),])
