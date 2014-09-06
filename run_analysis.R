# run_analysis.R
# Project for Data Cleaning Course

run_analysis<-function() {
     
     directory<-"UCI HAR Dataset"
     act_labels<-"activity_labels.txt"
     features<-"features.txt"
     fnm1<-paste(directory,act_labels,sep="/")
     fnm2<-paste(directory,features,sep="/")
     actLabels<-read.table(fnm1)
     feat<-read.table(fnm2)
     
     #print(actLabels)
     #print(feat)
     
     testsubj<- paste(directory, "test/subject_test.txt", sep="/")
     testx<- paste(directory, "test/X_test.txt", sep="/")
     testy<- paste(directory, "test/y_test.txt", sep="/")
     
     test_subj<-read.table(testsubj)
     test_x<-read.table(testx)
     test_y<-read.table(testy)
     all_test<-cbind(test_y,test_subj,test_x)
     a<-as.vector(feat[,2], mode="character")
     colnames(all_test) <- c("label","subject",a)
     
     #############
     trainsubj<- paste(directory, "train/subject_train.txt", sep="/")
     trainx<- paste(directory, "train/X_train.txt", sep="/")
     trainy<- paste(directory, "train/y_train.txt", sep="/")
     
     train_subj<-read.table(trainsubj)
     train_x<-read.table(trainx)
     train_y<-read.table(trainy)
     all_train<-cbind(train_y,train_subj,train_x)
     a<-as.vector(feat[,2], mode="character")
     colnames(all_train) <- c("label","subject",a)
     
     all_data<-rbind(all_test,all_train)

}