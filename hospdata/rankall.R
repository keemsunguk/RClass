##
#     Assignment 3 Part 3
#     Finding the ranking of hospital of all state from "outcome-of-care-measures.csv"

#     Parameters:
#          outcome: “heart attack”, “heart failure”, or “pneumonia”
#          num: Desired rank 
#    Return:
#         Hospital.Name

rankall<-function(outcome, num = "best") {
     oc <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
          
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
     uni_states<-unique(di[,3])
     states<-sort(uni_states)
     allstate<-NULL
     for(st in states[]) {  #
          ldi<-di[di[,3]==st,]    #set up local di
          if(length(ldi) == 0) {
               thedata<-cbind(NA,state)
          } else {
               if(length(ldi) == 3) {
                    ldi<-matrix(ldi,1,3)
               }
               mydata<-data.frame(Hospital.Name=as.character(ldi[,1]), Outcome=as.numeric(ldi[,2]), state=as.character(ldi[,3]))
               md<-mydata[ with(mydata, order(Outcome, Hospital.Name)), ]
     
               if( num == "best") {
                    thedata<-cbind(as.vector(md$Hospital.Name[md[,2]==min(md[,2])] ), st)
               } else if(num == "worst") {
                    thedata<-cbind(as.vector(md$Hospital.Name[md[,2]==max(md[,2])] ), st)
               } else {
                    rank = as.numeric(num)
                    if(rank >=1 && rank < length(md[,2]) ) {
                         thedata<-cbind(as.vector(md[rank,1] ), st)
                    } else {
                         thedata<-cbind(NA,st)
                    }
               }
          }
          allstate <-rbind(allstate,thedata)
     }  #end of for loop
     
     retdata<-data.frame(hospital=as.character(allstate[,1]), state=as.character(allstate[,2]))
}