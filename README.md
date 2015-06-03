# Predicting the Bike Sharing Demand
This repository contains my efforts to predict the bike demand in Washington D.C. 
The datasets used are from the Kaggle competition on predicting the [Bike Sharing Demand](https://www.kaggle.com/c/bike-sharing-demand/)

The [Description of the Analysis](Analysis Bike Sharing Demand.md) gives an explanation on how I came to my predictions. in the first part I mainly used SPSS V20.0.0 since I used it a lot before for linear regression and descriptive analyses.
The [Excel file](first results.xlsx) contains the first results from the linear regression model, including the extra attributes I generated for this analysis.

The 'final' predictions made by using the random forest regression algorithm can be found in [BikeSharingPrediction.R](BikeSharingPrediction.R).

The package used for the predictions in R is:
randomRorest
This can be installed by 
install.packages("randomForest")
