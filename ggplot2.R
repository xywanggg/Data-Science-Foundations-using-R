library(ggplot2)
str(mpg)
qplot(displ,hwy,data=mpg,color=drv)
qplot(displ,hwy,data=mpg,color=drv)+geom_smooth(method="lm")
qplot(displ,hwy,data=mpg,geom=c("point","smooth"))
qplot(displ,hwy,data=mpg,facets = .~drv)
qplot(displ,hwy,data=mpg,facets = .~drv)+geom_smooth(method="lm")

qplot(hwy,data=mpg,fill=drv)
qplot(hwy,data=mpg,facets=drv~.,binwidth=2)
qplot(hwy,data=mpg,geom="density")
qplot(hwy,data=mpg,geom="density",color=drv)

####basic components of a ggplot2 plot
#a data frame
#aesthetic mappings: how data are mapped to color, size
#geoms: geometric objects like points, lines, shapes
#facets: for conditional plots
#stats: statistical transformatuons like binning, quantiles, smoothing
#scales: what scale an aesthetic map uses
#coordinate system
#plots are built up in layers
#-plot the data
#-overlay a summary
#-metadata and annotation
qplot(displ,hwy,data=mpg,facets = .~drv,
      geom=c("point","smooth"), 
      method="lm")

g<-ggplot(mpg,aes(displ,hwy))
summary(g)
p<-g+geom_point()+facet_grid(.~drv)+geom_smooth(method="lm")
print(p)

####annotation
#labels: xlab(),ylab(),labs(),ggtitle()
#for things that only make sense glogally, use theme()
#two standard appearance themes are included
#-theme_gray():the default theme(gray bacground)
#-theme_bw():more stark/plain
g+geom_point(color="steelblue", size=4,alpha=1/2)
g+geom_point(aes(color=drv),size=4,alpha=1/2)
g+geom_point(aes(color=drv))+labs(title="this is a title")+labs(x="xxx",y="yyy")
g+geom_point(aes(color=drv),size=2,alpha=1/2)+geom_smooth(size=4,linetype=3,method="lm",se=FALSE)
g+geom_point(aes(color=drv))+theme_bw(base_family="Times")


