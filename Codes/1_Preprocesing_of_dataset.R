library(ggplot2)
library(tidyverse)
library(plyr)

df = read.csv("D:/OneDrive/Work/Personal Projects/Does-Gamer-Slang-Appeal-to-Gamers/Data/videos_data.csv", header = TRUE)

# Change al variables into their respected types----

df[,1] = as.character(df[,1])
df[,2] = as.character(df[,2])
df[,3] = as.numeric(df[,3])
df[,4] = as.numeric(df[,4])
df[,5] = as.character(df[,5])
df[,6] = as.numeric(df[,6])
df[,7] = as.numeric(df[,7])
df[,8] = as.character(df[,8])
df[,9] = as.character(df[,9])
df[,10] = as.factor(df[,10])
df[,11] = as.character(df[,11])
df[,12] = as.numeric(df[,12])
df[,13] = as.numeric(df[,13])
df[,14] = as.numeric(df[,14])
df[,15] = as.character(df[,15])

# Transform Video Categories as Strings ----

levels(df$vid_category)
levels(df$vid_category) = revalue(df$vid_category, c("1"="Film & Animation","2"="Autos & Vehicles","10"="Music",
                                                     "15"="Pets & Animals", "17"="Sports", "19"="Travel & Events",
                                                     "20"="Gaming","22"="People & Blogs","23"="Comedy",
                                                     "24"="Entertainment", "26"="Howto & Style","27"="Education",
                                                     "28"="Science & Technology","29"="Nonprofits & Activism"))

# Related Topics ----

# Initialization of vectors for each category
df$category_action_game <- rep(0,dim(df)[1]) #16
df$category_action_adventure_game <- rep(0,dim(df)[1])
df$category_casual_game <- rep(0,dim(df)[1])
df$category_music_game <- rep(0,dim(df)[1])
df$category_puzzle_game <- rep(0,dim(df)[1])
df$category_racing_game <- rep(0,dim(df)[1])
df$category_rpg_game <- rep(0,dim(df)[1])
df$category_simulation_game <- rep(0,dim(df)[1])
df$category_sports_game <- rep(0,dim(df)[1])
df$category_strategy_game <- rep(0,dim(df)[1]) #25

# df[1,5] #== "/m/0bzvm2-/m/025zzc" # So I need to remove /m/ and separate them
s = df[,5]
s = str_remove_all(s,"(/m/)")
s = str_split(s,'-', simplify = TRUE)

# THe clasifier to vector
for (r in 1:nrow(s)) {
  for (c in 1:ncol(s)) {
    if (s[r,c] == "025zzc"){
      df[r,16] = 1
    }
    if (s[r,c] == "02ntfj"){
      df[r,17] = 1
    }
    if (s[r,c] == "0b1vjn"){
      df[r,18] = 1
    }
    if (s[r,c] == "02hygl"){
      df[r,19] = 1
    }
    if (s[r,c] == "04q1x3q"){
      df[r,20] = 1
    }
    if (s[r,c] == "01sjng"){
      df[r,21] = 1
    }
    if (s[r,c] == "0403l3g"){
      df[r,22] = 1
    }
    if (s[r,c] == "021bp2"){
      df[r,23] = 1
    }
    if (s[r,c] == "022dc6"){
      df[r,24] = 1
    }
    if (s[r,c] == "03hf_rm"){
      df[r,25] = 1
    }
  }
}

apply(df[,16:25],2,sum)

# Video Duration to minutes ----

colnames(df)[8]
# s = c(df[6668:6669,8],df[21,8]) the three possible examples
# We have another problem where the hours and minutes are separted
# s = df[388,8]
# And another example more
# s = df[1726,8]
# s = str_remove_all(s,"(PT)|S")
# s = str_split(s,'M|H', simplify = TRUE)

for (i in 1:nrow(df)){
  s = df[i,8]
  s = str_remove_all(s,"(PT)|S")
  s = str_split(s,'M|H', simplify = TRUE)
  if (ncol(s) == 3) {
    a = as.numeric(s[1,1])*60
    b = as.numeric(s[1,2])
    if (s[1,3]== "") {
      df[i,8] = a + b
    }
    else {
      c = as.numeric(s[1,3])/60
      df[i,8] = a + b + c
    }
  }
  if (ncol(s) == 2) {
    a = as.numeric(s[1,1])
    if (s[2] == "") {
      df[i,8] = a
    }
    else {
      b =  as.numeric(s[1,2])/60
      df[i,8] = a + b
    }
  }
  if (ncol(s) == 1) {
    df[i,8] = as.numeric(s[1,1])/60
  }
}

class(df[,8])
df[,8] = as.numeric(df[,8])
which(is.na(df[,8]))
mean(df[1:21,8])

# Published Date ----

colnames(df)[15]
s = df[,15]
s = str_split(s,'T', simplify = TRUE)
s = s[,1]
df[,15] = as.Date(s)

# Distance between last episode MEASURED IN DAYS!  ----

df$space_between_vids = rep(0,nrow(df))

# I need to sort the publishing time by each user

df = df[order(-df$subcriber_count, df$published_date),]

# Now we calculate the space between each published video

for (i in 1:nrow(df)){
  if (i == nrow(df)) {
    df$space_between_vids[i] = NaN
  }
  else {
    if (df$channel_title[i] == df$channel_title[i+1]){
      df$space_between_vids[i] = df[i+1,15] - df[i,15]
    }
    else {
      df$space_between_vids[i] = NaN
    }
  }
}

summary(df$space_between_vids)

mean(df$space_between_vids, na.rm = TRUE )

rm('a','b','c','i','r','s')

# Create title lenght as a feature ----
df$vid_title_length = str_length(df[,1])

# Create description lenght ----
df$vid_descrip_length = str_length(df[,2])

# CLean the data for only Gamming Videos ----
df_raw = df

df = subset(df,df$vid_category == "Gaming")

