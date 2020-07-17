library(dplyr)
#select
chicago<-readRDS("chicago.rds")
dim(chicago)
head(select(chicag,1:5))
names(chicago)[1:3]
head(select(chicago,city:dptp))
#in dplyr
head(select(chicago,-(city:dptp)))
#equivalen base R
i<-match("city",names(chicago))
j<-match("dptp",names(chicago))
head(chicago[,-(i:j)])

#filter
chic.f<-filter(chicago,pm25tmean2>30)
head(select(chic.f, 1:3, pm25tmean2),10)
chic.f<-filter(chicago,pm25tmean2>30 & tmpd>80)
head(select(chic.f,1:3,pm25tmean2,tmpd),10)

#arrange
#reorder rows of a data frame
chicago<-arrange(chicagp,date)
head(select(chicago,date,pm25tmean2),3)
tail(select(chicago,date,pm25tmean2),3)

#columns can be arranged in descending order too
chicago<-arrange(chicago,desc(date))
head(select(chicago,date,pm25tmean2),3)
tail(select(chicago,date,pm25tmean2),3)

#rename
head(chicago[,1:5],3)
chicago<-rename(chicago,dewpoint=dptp,pm25=pm25tmean2)
head(chicago[,1:5],3)

#mutate
chicago<-mutate(chicago,pm25detrend=pm25-mean(pm25,na.rm=TRUE))
head(select(chicago,mp25,pm25detrend))

#groupby
chicago <- mutate(chicago, tempcat = factor(1 * (tmpd > 80), labels = c("cold", "hot"))) 
hotcold <- group_by(chicago, tempcat) 
summarize(hotcold, pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))

chicago <- mutate(chicago, year = as.POSIXlt(date)$year + 1900) 
years <- group_by(chicago, year) 
summarize(years, pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2, na.rm = TRUE), no2 = median(no2tmean2, na.rm = TRUE))

#%>%
chicago %>% mutate(month = as.POSIXlt(date)$mon + 1) 
%>% group_by(month) 
%>% summarize(pm25 = mean(pm25, na.rm = TRUE), 
              o3 = max(o3tmean2, na.rm = TRUE), 
              no2 = median(no2tmean2, na.rm = TRUE)) 







