###########################working with text
##fixing character vectors-tolower(), toupper()
cameraData<-read.csv("./data/camera.csv")
names(cameraData)
toupper(names(cameraData))
tolower(names(cameraData))

##fixing character vectors-strsplit()
#parameters:x, split
splitName=strsplit(names(cameraData),"\\.")
splitName[[1]]
splitName[[5]]
splitName[[6]]

##quick aside-lists
mylist<-list(letters=c("A","b","c"),numbers=1:3,matrix(1:25,ncol=5))
head(mylist)
mylist[1]
mylist$letters
mylist[[1]]

##fixing character vectors - sapply()
splitName[[6]][1]
firstElement<-function(x){x[1]}
sapply(splitName,firstElement)

##peer review data
reviews<-read.csv("./data/reviews.csv")
solutions<-read.csv("./data/solutions.csv")
head(reviews,2)
head(solutions,2)

##fixing character vectors -sub()
names(reviews)
sub("_","",names(reviews),)

##fixing charcter vectors -gsub()
testName<-"this_is_a_test"
sub("_","",testName)
gsub("_","",testName)

##finding values-grep(),grepl()
grep("Alameda", cameraData$intersection)
table(grepl("Alameda",cameraData$intersection))
cameraData2<-cameraData[!grepl("Alameda",cameraData$intersection),]
grep("Alameda",cameraData$intersection,value=TRUE)
grep("JeffStreet",cameraData$intersection)
length(grep("JeffStreet",cameraData$intersection))

##more useful string functions
library(stringr)
nchar("nation blala")
substr("studio haha",1,4)
paste("use","ful")
paste0("use","ful")
str_trim("useful   ")

########################working with date
d1=date()
class(d1)
d2=Sys.Date()
d2
class(d2)
#%d=day as number(0-31)  
#%a=abbreviated weekday  #%A=unabbreviated weekday 
#%m=month(00-12)  #%b=abbreviated month  #%B=unabbreviated month  
#%y=2 digit year  #%Y=four digit year
format(d2,"%a %b %d")

#create dates
x=c("1jan1960","2jan1960","31mar1960","30jul1960")
z=as.Date(x,"%d%b%Y")
z[1]-z[2]
as.numeric(z[1]-z[2])

#converting to julian
weekdays(d2)
nomths(d2)
julian(d2)

#Lubridate
library(lubridate)
ymd("20140108")
mdy("08/04/2013")
dmy("03-04-2013")

#dealing with times
ymd_hms("2011-09-02 10:22:01")
ymd_hms("2011-09-02 10:22:01", tz="Pacific/Auckland")
?Sys.timezone

#different syntax
x=dmy(c("1jan1960","2jan1960","31mar1960","30jul1960"))
wday(x[1])
wday(x[1],label=TRUE)

##POSIXct ##POSIXIt
























