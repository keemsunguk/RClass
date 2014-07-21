myadd<-function(a,b) {
     a+b
}

myaddvector <-function(x, n=10) {
     use<-x[x>n]
}

columnMean <-function(y, removeNA) {
     nc <-ncol(y)
     means <-numeric(nc)  ##empty vector
     for(i in 1:nc) {
          means[i] <-mean(y[,i], na.rm=removeNA)
     }
     means
}