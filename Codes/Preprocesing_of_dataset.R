library(ggplot2)
library(caret)
library(tidyverse)
library(plyr)

df = read.csv("D:/OneDrive/Work/Personal Projects/Does-Gamer-Slang-Appeal-to-Gamers/Data/videos_data.csv", header = TRUE)

# Pre-procesing todo:
#
# Change al variables into their respected data types
# Transform video categories iinto strings
# video_related_topics transformation into dummy's
# video duration transformation to minutes
# published date, remove the time
# create a distance between last episode

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

df[1,5] #== "/m/0bzvm2-/m/025zzc" # So I need to remove /m/ and separate them
s = df[3,5]
s = str_remove_all(s,"(/m/)")
s = str_split(s,'-', simplify = TRUE)



