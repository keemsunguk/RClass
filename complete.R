complete <- function(directory, id = 1:332) {
     allObservations<-NULL

     for(j in id) {
          fnmtmp<- paste("000",j, sep="")
          filenm<-substr(fnmtmp,nchar(fnmtmp)-2,nchar(fnmtmp))
          path <- paste(directory,filenm,sep="/")
          fname <-paste(path,".csv",sep="")
          allData<-read.csv(fname)
          
          noGoodData1<-complete.cases(allData[,2])
          noGoodData2<-complete.cases(allData[,3])
          completeObservation<-noGoodData1&noGoodData2

          allObservations <-rbind(allObservations,c(j,sum(completeObservation)))
     }
     frameData<-data.frame(allObservations)
     names(frameData)<-c("id","nobs")
     print(frameData)
}