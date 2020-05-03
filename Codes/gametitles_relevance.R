library(stringr)
library(quanteda)

a = dfm(unigrams)
a = as.data.frame(a)

df$presentgametitle = rep(0)

videgotittle_list = c("fortnite","minecraft","roblox", "apex", "royale","legends",
                      "warfare","modern", "pokemon","madden","nba","gta", "league",
                      "rainbow",  "six", "siege","hermitcraft","rust","uhc",'warfare',
                      'destiny')

for (title in videgotittle_list) {
  for (i in 1:nrow(a)) {
    if (a[i,which(colnames(a) == title)] == 1) {
      df$presentgametitle[i] = 1
    }
  }
}

df$

sum(df$presentgametitle)

summary(lm(df$vid_likes ~ df$presentgametitle + df$subcriber_count))

summary(lm(df$vid_comments ~ df$presentgametitle + df$subcriber_count))

summary(lm(df$vid_views ~ df$presentgametitle + df$subcriber_count))

summary(lm(df$vid_views ~ poly(df$vid_title_length,2) + df$subcriber_count))
