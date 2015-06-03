# Predicting the Bike Sharing Demand
This repository contains my efforts to predict the bike demand in Washington D.C. 
The datasets used are from the Kaggle competition on predicting the [Bike Sharing Demand](https://www.kaggle.com/c/bike-sharing-demand/).

The [Description of the Analysis](Analysis Bike Sharing Demand.md) gives an explanation on how I came to my predictions. In the first part I mainly used SPSS V20.0.0 since I used it a lot before for linear regression and different descriptive analyses.
The [Excel file](first results.xlsx) contains the first results from the linear regression model, including the extra attributes I generated for this analysis.

The predictions made in R by using the random forest regression algorithm can be found in [BikeSharingPrediction.R](BikeSharingPrediction.R).

After making a reasonable model with a RMSLE of 0.50620, I elaborated further on the model. The steps are briefly stated in [the document](Analysis Bike Sharing Demand.md) mentioned above. The script can be found in [BikeSharingPredictionV2.R](BikeSharingPredictionV2.R)

The final score I submitted (post-deadline) is: 0.48209