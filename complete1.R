complete <- function(directory, id = 1:332) {
      
      existingData <- NULL
      for(i in id) {
            fnmtmp <- paste("000",i, sep="")
            filenm <- substr(fnmtmp,nchar(fnmtmp)-2,nchar(fnmtmp))
            path <- paste(directory,filenm,sep="/")
            fname <- paste(path,".csv",sep="")
            data <- read.csv(fname)
            
            allGoodData <- c(data[ ,2] & data[ ,3])
            sumgd<-sum(complete.cases(allGoodData))
#numberofGoodData <- sum(allGoodData, na.rm = TRUE)
            
            existingData <- rbind(existingData, c(i, sumgd))
      }
      frameData <- data.frame(existingData)
      names(frameData) <- c("id", "nobs")
      #print(frameData)
      frameData
}