# Create a descriptive table for videos
df_vidstats = cbind(df$vid_views/1000,df$vid_likes, df$vid_dislikes, df$vid_comments, df$vid_duration,
                    df$vid_title_length, df$vid_descrip_length)

table = cbind(apply(df_vidstats, 2,mean),apply(df_vidstats, 2, sd),apply(df_vidstats, 2, min),
              apply(df_vidstats, 2, median),apply(df_vidstats, 2, max),rep(length(df[,1]),length(df_vidstats[1,])))
# Adding summary of space between vids
space = c(mean(df$space_between_vids, na.rm = TRUE), sd(df$space_between_vids, na.rm = TRUE),
          min(df$space_between_vids, na.rm = TRUE), median(df$space_between_vids, na.rm = TRUE),
          max(df$space_between_vids, na.rm = TRUE),(length(df[,1]) - length(which(is.na(df$space_between_vids)))))

table = rbind(table, space)
table = round(table,1)
rownames(table) = c("Video Views (in 1000's)",'Video Likes','Video Dislikes','Video Comments','Video Duration (m)',
                    'Video Title Character Length', 'Video Description Character Length','Days since last Uploaded Video')
colnames(table) = c("Mean","Standard Deviation","Min","Median",'Max',"n")
table = as.data.frame(table)

# Related Topics
apply(df[,16:25],2,sum)
# Video Categories
summary(df$vid_category)

#Create some data from channel
length(unique(df$channel_title))
channeldata = cbind(df$subcriber_count/1000, df$chanel_num_vids, df$chanel_total_views/10000)
chan_stats = cbind(apply(channeldata, 2,mean),apply(channeldata, 2, sd),apply(channeldata, 2, min),
                   apply(channeldata, 2, median),apply(channeldata, 2, max))
rownames(chan_stats) = c("Subcriber Count (1,000's)","Total Number of Videos","Total Number of Views (10,000's)")
colnames(chan_stats) = c("Mean","Standard Deviation","Min","Median",'Max')
chan_stats = as.data.frame(round(chan_stats,1))
rm('channeldata','space','df_vidstats')
