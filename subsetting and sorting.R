##############subsetting and sorting
##subsetting -quick review
set.seed(123)
x<-data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
x<-x[sample(1:5),];x$var2[c(1,3)]=NA
x
x[,1]
x[,"var1"]
x[1:2,"var2"]

##logicals ands and ors
x[x$var1<=3 & x$var3>11,]
x[x$var1<=3 | x$var3>11,]

##dealing with missing values
x[which(x$var2>8),]

##sorting
sort(x$var1)
x[sort(x$var1,decreasing=TRUE),]
sort(x$var1,decreasing = TRUE)
sort(x$var2,na.last=TRUE)

##ordering
x[order(x$var1),]
x[order(x$var1,x$var3),]

##ordering with plyr
library(plyr)
arrange(x,var1)
arrange(x,desc(var1))

##adding rows and columns
x$var4<-rnorm(5)
x
y<-cbind(x,rnorm(5))
y


###########summarizing data
##getting the data from the web
if(!file.exists("./data")){dir.create("./data")}
fileUrl<-"https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurants.csv")
restData<-read.csv("./data/restaurants.csv")

#look at a bit if the data
head(restData,n=3)
tail(restData,n=4)

#make summary
summary(restData)

#mpre in depth information
str(restData)

#quantiles of quantitative variables
quantile(restData$councilDistrict,na.rm=TRUE)
quantile(restData$councilDistrict,probs=c(0.5,0.75,0.9))

#make table
table(restData$zipCode, useNA="ifany")
table(restData$councilDistrict, restData$zipCode)

#check for missing values
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode>0)

#row and column sums
colSums(is.na(restData))
all(colSums(is.na(restData))==0)

#values with specific characteristics
table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212","21213"))
restData[restData$zipCode %in% c("21212","21213"),]

#cross table
data(UCBAdmissions)
DF=as.data.frame(UCBAdmissions)
summary(DF)
xt<-xtabs(Freq~Gender+Admit, data=DF)
xt

#flat table
warpbreaks$replicate<-rep(1:9,len=54)
xt=xtabs(breaks ~., data=warpbreaks)
xt
ftable(xt)

#size of a data set
fakeData=rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData),units="Mb")


###################creating new variables
restData<-read.csv("./data/restaurants.csv")
#creating sequences
s1<-seq(1,10,by=2);s1
s2<-seq(1,10,length=3); s2
x<-c(1,3,8,25,100);seq(along=x)

#subsetting variables
restData$nearMe=restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

#creating binary variales
restData$zipWrong=ifelse(restData$zipCode<0,TRUE,FALSE)
table(restData$zipWrong, restData$zipCode<0)

#creating categorical variables
restData$zipGroups=cut(restData$zipCode,breaks=quantile(restData$zipCode))
table(restData$zipCode)
table(restData$zipGroups,restData$zipCode)

#easier cutting
library(Hmisc)
restData$zipGroups=cut2(restData$zipCode,g=4)
table(restData$ziPGroups)

#creating factor variables
restData$zcf<-factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)

#levels of factor variables
yesno<-sample(c("yes","no"),size=10,replace = TRUE)
yesnofac=factor(yesno,levels=c("yes","no"))
relevel(yesnofac,ref="yes")
as.numeric(yesnofac)

#using teh mutate function
library(Hmisc);library(plyr)
restData2=mutate(restData,zipGroups=cut2(zipCode,g=4))
table(restData2$zipGroups)

##common transforms
abs(x)
sqrt(x)
ceiling(x)
floor(x)
round(x,digits=n)
signif(x,digits=n)
cos(x); sin(x); log(x); log2(x); log10(x); exp(x)

#####################reshaping data
library(reshape2)
head(mtcars)

#melting data frames
mtcars$carname<-rownames(mtcars)
carMelt<-melt(mtcars, id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))
head(carMelt,n=3)
tail(carMelt,n=3)

#casting data frames
cylData<-dcast(carMelt,cyl~variable)
cylData
cylData<-dcast(carMelt,cyl~variable,mean)
cylData

#averaging values
head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum)
spIns=split(InsectSprays$count,InsectSprays$spray)
spIns
sprCount=lapply(spIns,sum)
sprCount
unlist(sprCount)
sapply(spIns,sum)
ddply(InsectSprays,.(spray),summarize,sum=sum(count))

#creating a new variable
spraySums<-ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN=sum))
dim(sparySums)
head(spraySums)

############merging data
reviews=read.csv("./data/reviews.csv")
solutions<-read.csv("./data/solutions.csv")
head(reviews,2)
head(solutions,2)
#merge()
names(reviews)
names(solutions)
mergedData=merge(reviews,solutions,by.x="solution_id",by.y="ï..id",all=TRUE)
head(mergedData)

#merge all common column names
intersect(names(soultions),names(reveiws))
mergedData2=merge(reviews,solutions,all=True)
head(mergedData2)

#join in the plyr package
df1=data.frame(id=sample(1:10),x=rnorm(10))
df2=data.frame(id=dample(1:10),y=rnorm(10))
arrange(join(df1,df2),id)

#if you have multiple data frames
df1=data.frame(id=sample(1:10),x=rnorm(10))
df2=data.frame(id=sample(1:10),y=rnorm(10))
df3=data.frame(id=sample(1:10),y=rnorm(10))
dfList=list(df1,df2,df3)
join_all(dfList)











