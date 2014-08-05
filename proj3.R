##
#     Assignment 3 Part 1
#     Finding the best hospital in a state from "outcome-of-care-measures.csv"

#     Parameters:
#          state: State
#          outcome: “heart attack”, “heart failure”, or “pneumonia”
#    Return:
#         Hospital.Name

best<-function(state, outcome) {
     oc <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
     
     if( is.na(match(state,oc$State)) ) {
          stop("invalid state")
     }
     
     if(outcome == "heart attack") {
          oc[,11] <-as.numeric(oc[,11])
          gd1<-complete.cases(oc$State)
          gd2<-complete.cases(oc[,11])
          gd<-gd1&gd2
          oc<-cbind(oc, gd)
          di<-cbind(oc$Hospital.Name[oc$gd],oc$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack[oc$gd],oc$State[oc$gd])
     } else if (outcome == "heart failure") {
          oc[,17] <-as.numeric(oc[,17])
          gd1<-complete.cases(oc$State)
          gd2<-complete.cases(oc[,17])
          gd<-gd1&gd2
          oc<-cbind(oc, gd)
          di<-cbind(oc$Hospital.Name[oc$gd],oc$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure[oc$gd],oc$State[oc$gd])          
     } else if (outcome == "pneumonia") {
          oc[,23] <-as.numeric(oc[,23])
          gd1<-complete.cases(oc$State)
          gd2<-complete.cases(oc[,23])
          gd<-gd1&gd2
          oc<-cbind(oc, gd)
          di<-cbind(oc$Hospital.Name[oc$gd],oc$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia[oc$gd],oc$State[oc$gd])          
     } else {
          di<-NULL
          stop("Invalid outcome")
     }
     #Select state
     di<-di[di[,3]==state,]
     mydata<-data.frame(Hospital.Name=as.character(di[,1]), Outcome=as.numeric(di[,2]), state=as.character(di[,3]))
     outcome<-gsub(" ",".",outcome)
     #names(mydata)<-c("Hospital.Name",outcome,"State")
     #mydata[,2] <- as.numeric(mydata[,2])
     #md<-mydata[ with(mydata, order(Heart.Failure, Hospital.Name)), ]
     md<-mydata[ with(mydata, order(Hospital.Name)), ]
     mindata<-as.vector(md$Hospital.Name[md[,2]==min(md[,2])])
     mindata[1]
}