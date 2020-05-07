library(stringr)
library(quanteda)
library(stargazer)

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

sum(df$presentgametitle)

# df$presentgametitle + df$subcriber_count + df$vid_likes + df$vid_comments + df$vid_dislikes + df$vid_title_length +
# df$vid_duration + df$space_between_vids

likes = lm(df$vid_likes ~ df$presentgametitle + df$subcriber_count + df$vid_comments +
           df$vid_dislikes + df$vid_title_length + df$vid_duration + df$space_between_vids)
summary(likes)

commwents = lm(df$vid_comments ~ df$presentgametitle + df$subcriber_count + df$vid_likes +
               df$vid_dislikes + df$vid_title_length + df$vid_duration + df$space_between_vids)
summary(commwents)

views = lm(df$vid_views ~ df$presentgametitle + df$subcriber_count + df$vid_likes + df$vid_comments +
           df$vid_dislikes + df$vid_title_length + df$vid_duration + df$space_between_vids)
summary(views)

subscribers = lm(df$subcriber_count ~ df$presentgametitle + df$vid_likes + df$vid_comments +
                 df$vid_dislikes + df$vid_title_length + df$vid_duration + df$space_between_vids)
summary(subscribers)

stargazer(views, subscribers,commwents,likes, type = 'html',omit.stat = c("rsq", "f","ser"),intercept.bottom = FALSE,
          out="models.html")
