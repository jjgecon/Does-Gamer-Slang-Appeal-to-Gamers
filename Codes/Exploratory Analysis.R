library(ggplot2)

max(df$vid_views)
min(df$vid_views)

ggplot(data = subset(df, df$vid_views < mean(df$vid_views)), aes(x=vid_views)) + geom_histogram(bins = 50)
ggplot(data = subset(df, df$space_between_vids < 20), aes(x=space_between_vids)) + geom_histogram(bins = 20)

max(df$vid_views)/max(df$vid_likes)
max(df$vid_dislikes)
max(df$vid_comments)
min(df$vid_comments)

quantile(df$vid_views, prob = seq(0, 1, length = 11), type = 5)
