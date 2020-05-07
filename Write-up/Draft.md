# Does Gamer Slang Appel to Gamers? A YouTube Title Analysis
by Javier Gonzalez

on XX/XX/2020
## Preface

This is a mini project to understand the basic concepts of Natural Language Processing and Web Scrapping. Even though the findings are not groundbreaking, it was an interesting method to explore what makes a Gaming YouTube Channel successful.

## Introduction

YouTube has become an integral part of the video game community. Video game content creators upload “let’s plays”, skits, tutorials, and more about video games. [Out of the top 5 most subscribed channels, 2 of them are dedicated to video games](https://www.thinkwithgoogle.com/data-collections/gamer-demographics-gaming-statistics/). [Almost 66% of U.S. populations play some kind of video game, whether it is mobile, console or pc](https://www.nielsen.com/us/en/insights/report/2018/us-games-360-report-2018/). Additionally, [48% of YouTube gamers say they spend more time watching gaming videos on YouTube than playing games](https://www.thinkwithgoogle.com/data-collections/gamer-demographics-gaming-statistics/). In other words, YouTube Gaming community has a wide range of content creators and active members.

As a YouTube user, I sensed that every community has their own lingo. Words and abbreviation like "noob", "tea-bagging", "kill-streak", "gg" and "wp" are inherently related to video games. For instance, the abbreviation “gg” replaces “good game”, often used by gamers after a multiplayer game. This led me to ask some simple questions: Do gaming YouTuber’s include said lingo in their video titles? What type of words correlate with more views, comments, likes, or dislikes?

## YouTube Gaming Channels

To address the first question, I used YouTube’s API to collect data of the latest 100 videos from the top 200 most popular gaming channels on the 29th of January 2020. There were no mayor game releases during the start of the year. Thus, the selected sample better represents long run popularity. 

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

The summary of statistics of the videos are presented on Table 2. Video likes, dislikes, and comments do not have astronomical amounts of variation. Particularly, video dislikes are substantially lower than likes in all statistics. It seems that the proportion of YouTube viewers that like the videos are higher than those who does not. This is consistent with the premise that the sample contains popular and liked content creators. 

Contrary to human attention span theory, the average video is 20 minutes long with a median length of 13 minutes. According to [Clement (2017)](https://www.statista.com/statistics/1026923/youtube-video-category-average-length/), the average video length on YouTube is 11.7 minutes. Gamer viewers seems to like longer videos such as “let’s play” series or compilations of video game clips. Additionally, viewers like a frequent upload rate. The median day between uploads is 1 day. PewDiePie, one of the most subscribed channels on YouTube, [uploads daily because it’s a way to stay relevant leading to exhaustion](https://www.youtube.com/watch?v=RoFSqtrivFs).

Video titles are quite extensive. An average title, in the sample, is 54 words long close to the median video with 51. Trying to grab viewers attention and convey the video’s essence in a few words it is difficult. Not to mention, that a YouTube creator may need to come up with a title every single day. Thus, lengthy video titles may be  a way to address both issues a the same time. 

## Words

Two approaches were used to understand what words YouTube content creators use. First, a simple frequency count (how many times does a word repeats in a YouTube video) to understand the overall prevalence of certain words. Second a TF-IDF approach to understand the most relevant or important words. This latter methodology considers the length of the video title, penalizing those words who are frequent between and within game titles. Therefore, the remaining word are those who conveyed the most meaning in the title. 

### Methodology Notes

* For this study one token per video title word was considered. I wanted to analyse 2-gram and 1-gram tokens, but my computer does not have the memory power to process such a large dataframe without restricting the sample. Future work could eliminate extreme outliers in the sample and do an n-gram analysis to extract other conclusions. 
* Surprisingly, emojis where removed from the tokens lists. Although they were not commonly used, some channels used them in every video. As an interesting example, the shortest video tittle only contained two emojis.

### Most Frequent Words

In a simple examination the most popular words are video game titles. Fortnite and Minecraft conquer the frequency charts. It is no surprise that those video games are consider the most popular in 2020. Some other popular video game titles such as Roblox, Pokemon, Modern Warfare, Apex and League of Legends are part of the top 50 words, even though some of the individual words are separated in frequency – remember that I could not group consecutive words together in a 2-gram. A simple explanation is that the words like modern and warfare are used commonly without the game. For example, the video "Modern house style in Minecraft" has no relation to the video game Modern Warfare.

Another interesting feature is the frequency of the words "new", "vs", "episode" and "funny". This suggest two things. First, the words "new", "vs" and "funny" appeal to human curiosity and the possible entertainment of the video. This is consistent with general words that can easy grab viewers attention. Second, the word "episode" suggests a series of videos or video games. A popular serialized video game is called “The Walking Dead”  with 5 episodes, but none of the title words appear in the most frequent words. Therefore, the explanation could be "let’s plays" or compilation clips. A "let’s play" is a video where a content creator plays a video game and the viewers follow them along in episodes. Minecraft “let’s plays” are extremely popular, which can account for most of the frequency of the word "episode" and "minecraft".


##### Figure 1 - Most Used Wordcloud
![alt text](https://github.com/jjgecon/Does-Gamer-Slang-Appeal-to-Gamers/blob/master/Images/wordcloud1.png)

##### Figure 2
![alt text](https://github.com/jjgecon/Does-Gamer-Slang-Appeal-to-Gamers/blob/master/Images/freq1.png)

Because of the prevalence of video game titles in video titles, I performed the same frequency analysis elimination the most popular game titles. Words like "battle" where not eliminated because they can be used in other contexts. Figure 3 shows a word-cloud of this new token sample, while Figure 4 shows the frequency table.

##### Figure 3 - Most Used Wordclod Without Game Tittles
![alt text](https://github.com/jjgecon/Does-Gamer-Slang-Appeal-to-Gamers/blob/master/Images/wordcloud2.png)

##### Figure 4
![alt text](https://github.com/jjgecon/Does-Gamer-Slang-Appeal-to-Gamers/blob/master/Images/freq2.png)

The words "game", "new", "best", "gameplay" and "vs" top the chart. Although not that frequent, words like "secret", "ever", and "moments" help to convey to the viewer a sense of wonder and curiosity. Again, those words consistent with the intention to directly appeal to viewers by curiosity or the entertainment value of the video. Other words like "episode", "season", and "part" seem to support the prevalence of "let’s plays. As they are uploaded in episodes, sometimes subdivided by parts, by seasons. Additionally, the word "play" takes special relevance once video titles are removed.

Other than video game titles, there is no clear "gamer lingo" un YouTube titles. Although there is some support that gamers are more common than society thinks of them. Words like "team", "best", "play", "vs", and "ultimate" could be perfectly used in a sports context.

The TF-IDF analysis didn't add any value to the study. The reader can find the frequency tables from the TF-IDF process in figures 5 and 6 at the end.

## What correlates with video views, number of comments or likes?

## Discusion

There is some evidence that gaming YouTube content creators do not use game lingo in their titles. Which lead me to think three possible hypothesis. The first one, video titles, by themselves, are not that attractive to gamer viewers. The phenomenon of ["click-baiting"](https://ieeexplore.ieee.org/abstract/document/8424634) could easily reject this hypothesis, as many viewers are attracted to titles like ["Reading My Brother's Suicide Note"](https://www.youtube.com/watch?v=jIWQO4mLb9w). Second, successful YouTube channels may not need to use specific language to draw in their audience. For instanse, just mentioning the name of the game could be enough to attract views and subscribers. Nonetheless, the simple regressins doesn't seem to capture this effect. Third, gamers are not attracted by gamer words. As a result, YouTube creators use common lingo to describe their videos in the title. Common words related to video games like "battle", "new", and "best" start to take more importance. Novelty and admiration are typical hooks to grab viewers attention (try to find some evidence of this).

That said, with this methodology I cannot reject nor accept any hypothesis. Further study is needed to provide evidence that supports the common words hypothesis.

## Concluding Words

I admit it. I was quite ambitious with my research question. There is little connection between words chosen for a title and the success of a YouTubers. [Briggsby]() studied how does the YouTube search algorithm, not disclosed to the public, recommend videos to searchers. The frequency of a content creators’ videos in the search algorithm are positively correlated with YouTubers success. As more exposure leads to incremental exposure, thanks to YouTubes recommender system. However, video game titles rank 9 in importance, failing behind subscribers, total views, likes and comments.

A research question would have been: How does click-baiting in YouTube game titles and the success of the click-baiter? I could have used a neural network to identify click-bait titles and compare their statistics with other non-click-baiters. As an extension one could analyze what words are predominantly used form click-bait. Nevertheless, this project made me improve my quantitative skills in web scraping and natural language processing. In my eyes, the inconclusive results were just a biproduct of learning.

### Most Important Words Figures

##### Figure 5
![alt text](https://github.com/jjgecon/Does-Gamer-Slang-Appeal-to-Gamers/blob/master/Images/tfidf1.png)

##### Figure 6
![alt text](https://github.com/jjgecon/Does-Gamer-Slang-Appeal-to-Gamers/blob/master/Images/TFIDF2.png)
