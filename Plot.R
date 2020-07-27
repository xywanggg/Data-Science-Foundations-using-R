## principles of analytic graphics
#1 show comparisons
#2 show causality, mechanism, explanation
#3 show multivariate data
#4 integrate multiple modes of evidence
#5 describe and document the evidence
#6 content is king

pollution<-read.csv("./data/pm_tx.csv")
head(pollution)
summary(pollution$PM2.5)

#boxplot
boxplot(pollution$PM2.5,col="blue")
abline(h=12)

boxplot(PM2.5~COUNTY,data=pollution,col="pink")

#histogram
hist(pollution$PM2.5,col="green",breaks=50)
rug(pollution$pm2.5)
abline(v=12,lwd=2)
abline(v=median(pollution$PM2.5),col="red",lwd=4)

par(mfrow=c(2,1),mar=c(4,4,2,1))
hist(subset(pollution,COUNTY=="Dallas")$PM2.5,col="green")
hist(subset(pollution,COUNTY=="Ellis")$PM2.5,col="green")

#barplot
barplot(table(pollution$COUNTY),col="wheat",main='number')

#scatterplot
with(pollution, plot(LATITUDE,PM2.5)) #col=COUNTY
abline(h=12,lwd=2,lty=2)

par(mfrow=c(1,2),mar=c(5,4,2,1))
with(subset(pollution,COUNTY=="Dallas"),plot(LATITUDE,PM2.5,main="Dallas"))
with(subset(pollution,COUNTY=="Ellis"),plot(LATITUDE,PM2.5,main="Ellis"))


#########base plot
?par
#some important base graphics parameters
#pch: the plotting symbol (default is open circle)
#lty: the line type (default is solid line)
#lwd: the line width, specified as an integer multiple
#col: color
#xlab: character string for the x-axis label
#ylab: character string for the y-axis label

#las: the orientation of the axis labels on the plot
#bg: background color
#mar: the margin size
#oma: the outer margin size
#mfrow: number of plots per row, column(plots are filled row-wise)
#mfcol: number of plots per row, column(plots are filled column-wise)

#plot: make a scatterplot, or other type of plot
#lines: add lines to plot
#points: add points to a plot
#text: add text labels to a plot using specified x,y
#title: add annotations to x,y axis labels,title, subtitle, outer margin
#mtext: add arbitrary text to the margins (inner or outer) of the plot
#axis: adding axis ticks/labels

library(datasets)
with(airquality,plot(Wind,Ozone))
title(main="Ozone and Wind 1")

with(airquality,plot(Wind,Ozone,main="Ozone and Wind 2"))
with(subset(airquality,Month==5),points(Wind,Ozone,col="blue"))

with(airquality,plot(Wind,Ozone,main="Ozone and Wind 3",type="n"))
with(subset(airquality,Month==5),points(Wind,Ozone,col="blue"))
with(subset(airquality,Month!=5),points(Wind,Ozone,col="red"))
legend("topright",pch=1,col=c("blue","red"),legend=c("May","Other months"))

with(airquality,plot(Wind,Ozone,main="Ozone and Wind 4",pch=20))
model<-lm(Ozone~Wind,airquality)
abline(model,lwd=2)

par(mfrow=c(1,2))
with(airquality,{
  plot(Wind,Ozone, main="Ozone and Wind 5")
  plot(Solar.R,Ozone,main="Ozone and Solar Radiat 6")
})

par(mfrow=c(1,3),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(airquality,{
  plot(Wind,Ozone, main="Ozone and Wind 7")
  plot(Solar.R,Ozone, main="Ozone and Solar Radiation 8")
  plot(Temp,Ozone,main="Ozone and Temperature 9")
  mtext("Ozone and Weather in New York City", outer=TURE)
})







