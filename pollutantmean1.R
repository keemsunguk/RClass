pollutantmean <- function(directory, pollutant, id = 1:332) {
      
     compData <- NULL
     for(i in id) {
            fnmtmp <- paste("000",i, sep="")
            filenm <- substr(fnmtmp,nchar(fnmtmp)-2,nchar(fnmtmp))
            path <- paste(directory,filenm,sep="/")
            fname <- paste(path,".csv",sep="")
            data <- read.csv(fname)
      
            isPol <- FALSE
            if(pollutant == "sulfate" || pollutant == "Sulfate"){
                  compData <- c(compData, data[ ,2])
                  isPol <- TRUE
            } else if(pollutant == "nitrate" || pollutant == "Nitrate"){
                  compData <- c(compData, data[ ,3])
                  isPol <- TRUE
            } else {
                  print("Pollutant was not found. Please try with sulfate or nitrate.")
                  break
                  
            }
      }
      if(isPol == TRUE){
            finalMean <- mean(compData, na.rm = TRUE)
            print(finalMean)
      }
}