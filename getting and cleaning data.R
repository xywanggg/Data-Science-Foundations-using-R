## get/set working directory
getwd()
setwd()
setwd(choose.dir())

##checking for and creating directories
file.exists("directoryName") #check if the directory exists
dir.create("directoryName") #create a directory if it does not exist

if(!file.exists("data")){
  dir.create("data")
}

##get data from the internet
fileUrl<-"https://wwwxxxxx"
download.file(fileUrl,destfile="./data/xxxx.csv")
dateDownloaded<-data()
list.files("./data") #show the files list

##read local file
read.table() #parameters: file, header, sep, row.names, nrows
data<-read.table("xxx.csv",sep=",", header=TRUE)
data<-read.csv("xxx.csv") #parameters: quote, na.strings, nrows, skip

##read excel file
library(xlsx)
colIndex<-2:3
rowIndex<-1:4
data<-read.xlsx("xxx.xlsx",sheetIndex=1,
                colIndex=colIndex,rowIndex=rowIndex,header=TRUE)

##reading XML
library(XML)
fileUrl<-"http://www.xxxx.xml"
doc<-xmlTreeParse(fileUrl,useInternal=TRUE)
rootNode<-xmlRoot(doc)
xmlName(rootNode)
rootNote[[1]]
rootNode[[1]][[1]]
xmlSApply(rootNode,xmlValue)
#XPath
#/node -top level node
#//node -node at any level
#node[@attr-name] -node with an attribute name
xpathSApply(rootNode,"//name", xmlValue)
xpathSApply(rootNode,"//price",xmlValue)
xpathSApply(doc,"//li[@class='score']",xmlValue)

##data.table 
#inherets from data.frame
library(data.table)
df=data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnom(9))
head(df,3)
dt=data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(dt,3)
tables()
#subsetting rows
dt[2,]
dt[dt$y=='a',]
dt[c(2,3)]
#subsetting columns
dt[,c(2,3)]
#column subsetting in data.table
k={print(10);5}
print(k)
#calculating values for variables with expressions
dt[,list(mean(x),sum(z))]
dt[,table(y)]
#adding new columns
dt[,w:=10]
dt2<-dt
dt[,y:=66] #dt2=dt, should use .copy
#multiple operations
dt[,m:={tmp<-(x+w); 10*(tmp+5)}]
#plyr like operations
dt[,a:=x>0]
dt[,b:=mean(x+w),by=a]
#special variables
set.seed(123)
dt<-data.table(x=sample(letters[1:3],1E5,TRUE))
dt[,.N,by=x]
#keys
dt<-data.table(x=rep(c("a","b","c"),each=5),y=rnorm(15))
setkey(dt,x)
dt['a']
#joins
dt1<-data.table(x=c('a','a','b','cc'),y=1:4)
dt2<-data.table(x=c('a','b','dd'),z=5:7)
setkey(dt1,x);setkey(dt2,x)
merge(dt1,dt2)



