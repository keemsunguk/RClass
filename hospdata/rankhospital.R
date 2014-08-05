##
#     Assignment 3 Part 2
#     Finding the ranking of hospital in a state from "outcome-of-care-measures.csv"

#     Parameters:
#          state: State
#          outcome: “heart attack”, “heart failure”, or “pneumonia”
#          num: Desired rank 
#    Return:
#         Hospital.Name

rankhospital<-function(state, outcome, num = "best") {
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
     md<-mydata[ with(mydata, order(Outcome, Hospital.Name)), ]
     #md<-mydata[ with(mydata, order(Hospital.Name)), ]
     if( num == "best") {
          thedata<-as.vector(md$Hospital.Name[md[,2]==min(md[,2])])
     } else if(num == "worst") {
          thedata<-as.vector(md$Hospital.Name[md[,2]==max(md[,2])])
     } else {
          rank = as.numeric(num)
          if(rank >=1 && rank < length(md[,2]) ) {
               thedata<-as.vector(md[rank,1])
          } else {
              thedata<-NA
          }
     }
     thedata[1]
}