#Setting Directory
setwd("C:\\Users\\it24610823\\Desktop\\IT24610823\\Lab 04-20250821")

#Importing the data set
data<-read.table("Exercise.txt", header= TRUE, sep = ",")

#View the file in a separate window
fix(data)

#Attach the file into R
attach(data)

#Obtaining Box Plots
boxplot(Sales_X1,main="Box plot for Sales", outline= TRUE, outpch=8, horizontal=TRUE)
boxplot(Advertising_X2,main="Box plot for Advertising", outline= TRUE, outpch=8, horizontal=TRUE)
boxplot(Years_X3,main="Box plot for Years", outline= TRUE, outpch=8, horizontal=TRUE)

#Obtaining Histogram
hist(Sales_X1, ylab="Branch", xlab="Sales", main="Histogram for Sales")
hist(Advertising_X2, ylab="Branch", xlab="Advertising", main="Histogram for Advertising")
hist(Years_X3, ylab="Branch", xlab="Years", main="Histogram for Years")

#Stem & Leaf Plot
stem(Sales_X1)
stem(Advertising_X2)
stem(Years_X3)

#Mean
mean(Sales_X1)
mean(Advertising_X2)
mean(Years_X3)

#Median
median(Sales_X1)
median(Advertising_X2)
median(Years_X3)

#Calculate the five number summary
summary(Sales_X1)
summary(Advertising_X2)
summary(Years_X3)

#IQR 
IQR(Sales_X1)

IQR(Advertising_X2)
IQR(Years_X3)

#outliers
get.outliers <- function(z){
  q1<-quantile(z)[2]
  q3<-quantile(z)[4]
  iqr<- q3 - q1
  
  ub <- q3 +1.5*iqr
  lb <- q1 -1.5*iqr
  
  print(paste("Upper Bound = ",ub))
  print(paste("Lower Bound = ",lb))
  print(paste("Outliers :  ", paste(sort(z[z<lb | z>ub]),collapse = ", ")))
}

get.outliers(Sales_X1)
get.outliers(Advertising_X2)
print(get.outliers(Years_X3))
