#Quiz 1 - Cleaning Data
fdata<-download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv","quiz1.csv", method="curl")
fdata<-read.csv("quiz1.csv")
vtb<-table(valfdata$VAL)
vtb<-table(fdata$VAL)
sum(vtb[14:24])
fdata$FES
#install.packages("xlsx")
library(xlsx)
dat<-read.xlsx("getdata-data-DATA.gov_NGAP.xlsx",1,rowIndex=18:23, colIndex=7:15)
library(XML)
download.file(furl,"q4.xml",method="curl")
q4<-xmlTreeParse("q4.xml", useInternal=TRUE)
rootnode<-xmlRoot(q4)
xmlName(rootnode)
zip<-xpathSApply(rootnode,"//zipcode",xmlValue)
zipQ4<-zip[zip="21231"]
count(zipQ4)
zipQ4<-zip[zip=="21231"]
head(zipQ4)
table(zipQ4)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv","q5.csv",method="curl")
library("data.table")a4<-DT[,mean(pwgtp15),by=SEX]
a3<-mean(DT$pwgtp15,by=DT$SEX)
a2<-tapply(DT$pwgtp15,DT$SEX,mean)
aa3<-rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
aa2<-mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
aa1<-sapply(split(DT$pwgtp15,DT$SEX),mean)
sum(dat$Zip*dat$Ext,na.rm=T)

DT<-fread("q5.csv")
