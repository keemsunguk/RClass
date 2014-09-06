corr <- function(directory, threshold = 0){
      
      cObs <- complete(directory)
      index<-cObs[cObs[2]>threshold, "id"]
      
      cr <- NULL
      for(i in index){
            fnmtmp <- paste("000",i, sep="")
            filenm <- substr(fnmtmp,nchar(fnmtmp)-2,nchar(fnmtmp))
            path <- paste(directory,filenm,sep="/")
            fname <- paste(path,".csv",sep="")
            data <- read.csv(fname)
            
            goodData1 <- data[,2]
            goodData2 <- data[,3]
            corData<-cor(goodData1,goodData2,use="complete.obs")
            cr <- append(cr,corData)
      }
      print(cr)

}