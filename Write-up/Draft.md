# Does Gamer Slang Appel to Gamers? A YouTube Title Analysis
by Javier Gonzalez

## Preface

This is a mini project to understand the basic concepts of Natural Language Processing and Web Scrapping using API. Even though the findings are not groundbreaking, it was an interesting method to explore what makes a Gaming YouTube Channel successful.

## Introduction

YouTube has become an integral part of the video game community. Video game content creators upload “let’s plays”, skits, tutorials, and more about video games. [Out of the top 5 most subscribed channels, 2 of them are dedicated to video games](https://www.thinkwithgoogle.com/data-collections/gamer-demographics-gaming-statistics/). [Almost 66% of U.S. populations play some kind of video game, whether it is mobile, console or pc](https://www.nielsen.com/us/en/insights/report/2018/us-games-360-report-2018/). Additionally, [48% of YouTube gamers say they spend more time watching gaming videos on YouTube than playing games](https://www.thinkwithgoogle.com/data-collections/gamer-demographics-gaming-statistics/). In other words, YouTube Gaming community has a wide range of content creators and active members.

As a YouTube user, I sensed that every community has their own lingo. Words and abbreviation like "noob", "tea-bagging", "kill-streak", "gg" and "wp" are inherently related to video games. For instance, the abbreviation “gg” replaces “good game”, often used by gamers after a multiplayer game. This led me to ask some simple questions: Do gaming YouTuber’s include said lingo in their video titles? What type of words correlate with more views, comments, likes, or dislikes?

## YouTube Gaming Channels

To address the first question, I used YouTube’s API to collect data of the latest 100 videos from the top 200 most popular gaming channels on the 29th of January 2019. There were no mayor game releases during the start of the year. Thus, the selected sample better represents long run popularity. 

##### Table 1 - Channels Descriptive Statistics
Stat |Mean| Standard Deviation|   Min|  Median|     Max | n
 ---| --- |---|----|---| ---- | ---
Subcriber Count (1,000's)| 3693.5 |4806.9  | 0.0|  1980.0|   24900  | 2000
Total Number of Videos |  2206.9  | 9835.4 | 16.0 | 1033.0|  136133 | 2000
Total Number of Views (10,000's)| 132410.9   |255941.3| 154.6| 42321.2| 1608774 | 2000

The summary of statistics of the videos are presented on Table 1. The mean channel has 3.693.500 subscribers, which means that popular channels where selected. The minimum of subscribers displayed is 0. YouTube allows channels to [hide their subcriber count](https://support.google.com/youtube/answer/7280190?hl=en) from the public. The channel "VanossGaming Editor" is only one channel that used this feature in the sample. Their most popular videos have over 1 million views, which can be considered a popular channel. 

There is a significant variance on each statistic. Similar to income inequality, the distribution of "successful' gaming YouTube channels has colossal distance between quintiles. For instance, the difference between the most subscribed channel and the median subscribed channel is 4.8 standard deviations. A similar phenomenon happens in the total number of videos and the total number of views. This may be due to the presence of outliers. However, statistical outliers, in this case, does not cause concern for the study. By definition, successful channels are outliers which are the subjects to study.

##### Table 2 - Videos Descriptive Statistics
Stat|Mean|Standard Deviation|Min|Median|Max|n
 ---| --- |-------------|-------------|-------------|-------------| -----
Video Views (in 1000's) | 893.2	|2605.9	|0.0	|431.8	|286469.0 	|19187
Video Likes|	7948.7	|4615.8|	1.0	|7986.0	|15819.0	|19187
Video Dislikes|	1498.0|	865.8|	1.0|	1549.0|	2919.0|	19187
Video Comments|	2956.9|	1862.9|	1.0|	2878.0|	6136.0|	19187
Video Duration (m)|	19.9|	34.7|	0.2|	13.0|	954.5|	19187
Video Title Character Length|	53.7	|20.9|	2.0|	51.0|	188.0|	19187
Video Description Character Length|	881.7|	694.8|	0.0|	731.0|	5126.0|	19187
Days since last Uploaded Video|	2.7|	9.8|	0.0|	1.0|	731.0|	17248

The summary of statistics of the videos are presented on Table 2.

## Most Frequent Words

##### Figure  - Most Used Wordcloud
![alt text](https://github.com/jjgecon/Does-Gamer-Slang-Appeal-to-Gamers/blob/master/Images/wordcloud1.png)

##### Figure 
![alt text](https://github.com/jjgecon/Does-Gamer-Slang-Appeal-to-Gamers/blob/master/Images/freq1.png)

##### Figure  - Most Used Wordclod Without Game Tittles
![alt text](https://github.com/jjgecon/Does-Gamer-Slang-Appeal-to-Gamers/blob/master/Images/wordcloud2.png)

##### Figure 
![alt text](https://github.com/jjgecon/Does-Gamer-Slang-Appeal-to-Gamers/blob/master/Images/freq2.png)


## Most Important Words

##### Figure 
![alt text](https://github.com/jjgecon/Does-Gamer-Slang-Appeal-to-Gamers/blob/master/Images/tfidf1.png)

##### Figure 
![alt text](https://github.com/jjgecon/Does-Gamer-Slang-Appeal-to-Gamers/blob/master/Images/TFIDF2.png)

## What correlates with video views, number of comments or likes?

## Discusion

In this study I found that...

The results from video game titles are not what I expected. This could be caused by three mechanisms. First, the video titles by themselves are not that attractive to the gamer audience. Although the phenomenon of ["click-baiting"](https://ieeexplore.ieee.org/abstract/document/8424634) could easily reject this hypothesis. Second, successful YouTube channels may not need to use specific language to draw in their audience. For intense, just mentioning the name of the game could be enough to attract views and subscribers. This may be consistent with the findings. Third, gamers are not attracted by extremely gamer words. As a result, YouTube creators use common lingo to describe their videos in the title. Again, the results seem to point to that direction. That said, this study is trying to find correlations and not causal mechanisms. Therefore, I cannot reject of affirm any of the latter hypothesis. 

## Concluding Words