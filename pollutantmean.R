pollutantmean <- function(directory, pollutant, id = 1:332) {
     ## 'directory' is a character vector of length 1 indicating
     ## the location of the CSV files
     meanEach <- 1:length(id)
     polData<-NULL
     for(j in id) {
          fnmtmp<- paste("000",j, sep="")
          filenm<-substr(fnmtmp,nchar(fnmtmp)-2,nchar(fnmtmp))
          path <- paste(directory,filenm,sep="/")
          fname <-paste(path,".csv",sep="")
          data<-read.csv(fname)

          if(pollutant == "sulfate") {
               polData<-c(polData,data[,2])
          } else if (pollutant == "nitrate") {
               polData<-c(polData,data[,3])
          } else {
               print("Error: pollutant not found")
          }
          
     }
#     print("=====================")
     meanFinal = mean(polData,na.rm=TRUE)
#     print(meanFinal)
}

