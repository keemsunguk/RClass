#R: Data cleaning Quiz 2
library(httr)
oauth_endpoints("github")
#install.packages("httpuv")
library(httpuv)
myapp = oauth_app("github",key="17b77a805ef7c7f501b7", secret="a540ce7c9c1f62f58a7649977c7706a59a2f9ef6")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
#then authorize the application on web browser
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
library(jsonlite)
json1= content(req)
json2 = jsonlite::fromJSON(toJSON(json1))
#to find when it was first create.
json1[[1]]$created_at
#######################
# no 2
library("sqldf", lib.loc="/Library/Frameworks/R.framework/Versions/3.0/Resources/library")
fdata<-download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv","quiz2.csv", method="curl")
fdata<-read.csv("quiz2.csv")
db<-sqldf("select pwgtp1 from fdata where AGEP < 50")
#######################
# no 3
q3t<-unique(fdata$AGEP)
head(q3t,10)
##########################
# no 4
library(httr)
html=GET("http://biostat.jhsph.edu/~jleek/contact.html")
cont=content(html,as="text")
parsedHtml = htmlParse(cont, asText=TRUE)
#no 5
a<-read.fwf("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for", c(10,9,4,9,4,9,4,9,4),skip=4,col.names=c("week","1","2","1","2","1","2","1","2"))
