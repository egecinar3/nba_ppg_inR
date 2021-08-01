library("nbastatR")
library("dplyr")
library(RCurl)
library(reactable)
NBAData <- bref_players_stats(seasons = 2021)

table <- data.frame(NBAData %>% filter(countGames > 50) %>% 
                      select(namePlayer, ptsPerGame) %>% 
                      arrange(desc(ptsPerGame)))


colnames(table) <- c("Player", "Points Per Game")

options(reactable.theme = reactableTheme(
  backgroundColor = "#99CCFF"
  
))
reactable(
  head(table, 10)
)