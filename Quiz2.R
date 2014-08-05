library(datasets)
data(iris)
q1data<-iris$Sepal.Length[iris$Species == "virginica"]
x<-list(q1data)
q1<-lapply(x,mean)
q1

q2<-apply(iris[, 1:4], 2, mean)

library(datasets)
data(mtcars)
with(mtcars, tapply(mpg, cyl, mean))
x<-with(mtcars, tapply(hp, cyl, mean))
q4<-x[3]-x[1]

