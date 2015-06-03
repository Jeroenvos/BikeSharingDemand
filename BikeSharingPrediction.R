#Settings
##set working directorry on my local computer
setwd("/Users/jeroenvos/Dropbox/1 Private/GITHUB/BikeSharingDemand")

## clear workspace
rm(list=ls())

## Load libraries
library(randomForest)
#set seed in case of random number that are used
set.seed(123)

#Load Kaggle datasets
traindata <- read.csv("data/train.csv", header=TRUE, sep = ",")
testdata <- read.csv("data/test.csv", header = TRUE, sep = ",")

#load the data (with extended attributes) that is already is cleaned for the linear regression
extdata <- read.csv("data/exttrain.csv", header=TRUE, sep = ",")
exttestdata <- read.csv("data/exttest.csv", header=TRUE, sep = ",")


#Create a random Forest model
fit <- randomForest(count ~ holiday + workingday + temp + atemp + humidity + windspeed + hours + hoursS + spring + summer + fall + winter + better + good + bad + worse, data=extdata)
#make predictions based on 'fit'
pred <- predict(fit, exttestdata)

# validate the models (from example: http://www.inside-r.org/packages/cran/randomForest/docs/rfcv)
## make a attributes data frame
attributes <- data.frame(extdata$holiday, extdata$workingday, extdata$temp, extdata$atemp, extdata$humidity, extdata$windspeed, extdata$days, extdata$hours, extdata$hoursS, extdata$spring, extdata$summer, extdata$fall, extdata$winter, extdata$better, extdata$good, extdata$bad, extdata$worse)
## Set up random forest cross validation
result <- replicate(5, rfcv(attributes, extdata$count), simplify=FALSE)
error.cv <- sapply(result, "[[", "error.cv")
matplot(result[[1]]$n.var, cbind(rowMeans(error.cv), error.cv), type="l",
        lwd=c(2, rep(1, ncol(error.cv))), col=1, lty=1, log="x",
        xlab="Number of variables", ylab="CV Error")
# This validation returns the MSE iso RMSLE 
## ** running the validation takes a lot of time**


#Write predictions to the submission file
preddata <- data.frame(testdata[,1], round(pred,0), stringsAsFactors=FALSE)
colnames(preddata)<- c("datetime","count")
write.csv(preddata, "data/submission.csv", row.names=FALSE, quote=FALSE)

