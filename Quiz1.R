#Practice Quiz 1

setwd("~/Documents/R/Practice")
data<-read.csv("hw1_data.csv")
tail(data,2)
data[47,]
data[,1]
badsubdata<-is.na(subdata)
badsubdata
subdata[!badsubdata]
goodsub<-subdata[!badsubdata]
mean(goodsub)
oz<-data[data[1]>31 & data[4]>90,]
solSub<-oz[,2]
solSub
gsol<-complete.cases(solSub)
gsol
gsolData<-solSub[gsol]
gsolData
mean(gsolData)
jundata<-data[data[5]==6,]
jundata
tempjun<-jundata[,4]
mean(tempjun)
maydata<-data[data[5]==5,]
maydata
gmay<-complete.cases(maydata[,1])
mayoz<-maydata[,1]
mayoz
gmayoz<-mayoz[gmay]
mean(gmayoz)
max(gmayoz)
