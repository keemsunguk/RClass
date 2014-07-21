corr <- function(directory, threshold = 0) {
     cObs<-complete(directory)
     ids<-cObs[cObs[2]>threshold, "id"]
     print(ids)
     cr<-NULL
     for(j in ids) {
          fnmtmp<- paste("000",j, sep="")
          filenm<-substr(fnmtmp,nchar(fnmtmp)-2,nchar(fnmtmp))
          path <- paste(directory,filenm,sep="/")
          fname <-paste(path,".csv",sep="")
          allData<-read.csv(fname)
          
          goodData1<-allData[,2]
          goodData2<-allData[,3]
          corData<-cor(goodData1,goodData2,use="complete.obs")
          cr<-append(cr,corData)
     }    
     
     print(cr)
}