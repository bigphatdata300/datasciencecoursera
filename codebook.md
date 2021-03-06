--
title:  Codebook for run_analysis.R
author: Karl Snyder
date:   Mar 3, 2016
output:
  data.frame
---
  
## Project Description
The objective of this script is to create a single data set that meets the following criteria:

1 Merges the training and the test sets to create one data set.

2 Extracts only the measurements on the mean and standard deviation for each measurement.

3 Uses descriptive activity names to name the activities in the data set 

4 Appropriately labels the data set with descriptive variable names. 

5 From the data set in step 4, creates a data set with the average of each variable for each activity and each subject

##Study design and data processing
A description of the original study, data collection, and variable calculations can be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Notes on the original (raw) data. The raw data for this script can be sourced from the following files. The path assumes that the files are in the working directory.

"./features.txt" - names of the 561 metrics from the original study

"./activity_labels.txt"" - description of each of the 6 activity types

"./train/subject_train.txt" - subject ids the 7352 obs in the training subgroup

"./train/y_train.txt" - activity ids for the 7352 obs in the training subgroup

"./train/x_train.txt" - values for each metric and obs in the training subgroup

"./train/subject_test.txt" - subject ids the 7352 obs in the test subgroup

"./train/y_test.txt" - activity ids for the 7352 obs in the test subgroup

"./train/x_test.txt" - values for each metric and obs in the test subgroup

## Creating the tidy datafile

1. Install plyr and dplyr packages. This script uses functions from the plyr and dplyr package and starts with library() for each.
2. Read in the descriptive files "features.txt" and "activity_labels.txt"
3. Extract the column headings and associated indexes for mean and standard deviation metrics using grep().
4. Build the tidy training data set.  Read in the subject, activity, and variables (x_train) files from the train folder.  
5. Extract the mean and std deviation metrics based on step 3. Combine using cbind().
6. Repeat steps 4&5 for the test data set.
7. Combine tidy train and test data using rbind() to get an overall tidy data set that meets objectives 1-4.
8. Create a summary data set of means for each metric by subject and activity called "results"

## Description of the variables in the results.txt file including a) number of rows and columns, b) name of each column, c) class of each column.

'data.frame':	180 obs. of  69 variables:

 $ subject                   : int  1 1 1 1 1 1 2 2 2 2 ...

 $ activitynum               : int  1 2 3 4 5 6 1 2 3 4 ...

 $ activitydescription       : Factor w/ 6 levels "LAYING","SITTING",..: 4 6 5 2 3 1 4 6 5 2 ...

 $ tBodyAcc_mean_X           : num  0.277 0.255 0.289 0.261 0.279 ...

 $ tBodyAcc_mean_Y           : num  -0.01738 -0.02395 -0.00992 -0.00131 -0.01614 ...

 $ tBodyAcc_mean_Z           : num  -0.1111 -0.0973 -0.1076 -0.1045 -0.1106 ...

 $ tBodyAcc_std_X            : num  -0.284 -0.355 0.03 -0.977 -0.996 ...

 $ tBodyAcc_std_Y            : num  0.11446 -0.00232 -0.03194 -0.92262 -0.97319 ...

 $ tBodyAcc_std_Z            : num  -0.26 -0.0195 -0.2304 -0.9396 -0.9798 ...

 $ tGravityAcc_mean_X        : num  0.935 0.893 0.932 0.832 0.943 ...

 $ tGravityAcc_mean_Y        : num  -0.282 -0.362 -0.267 0.204 -0.273 ...

 $ tGravityAcc_mean_Z        : num  -0.0681 -0.0754 -0.0621 0.332 0.0135 ...

 $ tGravityAcc_std_X         : num  -0.977 -0.956 -0.951 -0.968 -0.994 ...

 $ tGravityAcc_std_Y         : num  -0.971 -0.953 -0.937 -0.936 -0.981 ...

 $ tGravityAcc_std_Z         : num  -0.948 -0.912 -0.896 -0.949 -0.976 ...

 $ tBodyAccJerk_mean_X       : num  0.074 0.1014 0.0542 0.0775 0.0754 ...

 $ tBodyAccJerk_mean_Y       : num  0.028272 0.019486 0.02965 -0.000619 0.007976 ...

 $ tBodyAccJerk_mean_Z       : num  -0.00417 -0.04556 -0.01097 -0.00337 -0.00369 ...

 $ tBodyAccJerk_std_X        : num  -0.1136 -0.4468 -0.0123 -0.9864 -0.9946 ...

 $ tBodyAccJerk_std_Y        : num  0.067 -0.378 -0.102 -0.981 -0.986 ...

 $ tBodyAccJerk_std_Z        : num  -0.503 -0.707 -0.346 -0.988 -0.992 ...

 $ tBodyGyro_mean_X          : num  -0.0418 0.0505 -0.0351 -0.0454 -0.024 ...

 $ tBodyGyro_mean_Y          : num  -0.0695 -0.1662 -0.0909 -0.0919 -0.0594 ...

 $ tBodyGyro_mean_Z          : num  0.0849 0.0584 0.0901 0.0629 0.0748 ...

 $ tBodyGyro_std_X           : num  -0.474 -0.545 -0.458 -0.977 -0.987 ...

 $ tBodyGyro_std_Y           : num  -0.05461 0.00411 -0.12635 -0.96647 -0.98773 ...

 $ tBodyGyro_std_Z           : num  -0.344 -0.507 -0.125 -0.941 -0.981 ...

 $ tBodyGyroJerk_mean_X      : num  -0.09 -0.1222 -0.074 -0.0937 -0.0996 ...

 $ tBodyGyroJerk_mean_Y      : num  -0.0398 -0.0421 -0.044 -0.0402 -0.0441 ...

 $ tBodyGyroJerk_mean_Z      : num  -0.0461 -0.0407 -0.027 -0.0467 -0.049 ...

 $ tBodyGyroJerk_std_X       : num  -0.207 -0.615 -0.487 -0.992 -0.993 ...

 $ tBodyGyroJerk_std_Y       : num  -0.304 -0.602 -0.239 -0.99 -0.995 ...

 $ tBodyGyroJerk_std_Z       : num  -0.404 -0.606 -0.269 -0.988 -0.992 ...

 $ tBodyAccMag_mean_         : num  -0.137 -0.1299 0.0272 -0.9485 -0.9843 ...

 $ tBodyAccMag_std_          : num  -0.2197 -0.325 0.0199 -0.9271 -0.9819 ...

 $ tGravityAccMag_mean_      : num  -0.137 -0.1299 0.0272 -0.9485 -0.9843 ...

 $ tGravityAccMag_std_       : num  -0.2197 -0.325 0.0199 -0.9271 -0.9819 ...

 $ tBodyAccJerkMag_mean_     : num  -0.1414 -0.4665 -0.0894 -0.9874 -0.9924 ...

 $ tBodyAccJerkMag_std_      : num  -0.0745 -0.479 -0.0258 -0.9841 -0.9931 ...

 $ tBodyGyroMag_mean_        : num  -0.161 -0.1267 -0.0757 -0.9309 -0.9765 ...

 $ tBodyGyroMag_std_         : num  -0.187 -0.149 -0.226 -0.935 -0.979 ...

 $ tBodyGyroJerkMag_mean_    : num  -0.299 -0.595 -0.295 -0.992 -0.995 ...

 $ tBodyGyroJerkMag_std_     : num  -0.325 -0.649 -0.307 -0.988 -0.995 ...

 $ fBodyAcc_mean_X           : num  -0.2028 -0.4043 0.0382 -0.9796 -0.9952 ...

 $ fBodyAcc_mean_Y           : num  0.08971 -0.19098 0.00155 -0.94408 -0.97707 ...

 $ fBodyAcc_mean_Z           : num  -0.332 -0.433 -0.226 -0.959 -0.985 ...

 $ fBodyAcc_std_X            : num  -0.3191 -0.3374 0.0243 -0.9764 -0.996 ...

 $ fBodyAcc_std_Y            : num  0.056 0.0218 -0.113 -0.9173 -0.9723 ...

 $ fBodyAcc_std_Z            : num  -0.28 0.086 -0.298 -0.934 -0.978 ...

 $ fBodyAccJerk_mean_X       : num  -0.1705 -0.4799 -0.0277 -0.9866 -0.9946 ...

 $ fBodyAccJerk_mean_Y       : num  -0.0352 -0.4134 -0.1287 -0.9816 -0.9854 ...

 $ fBodyAccJerk_mean_Z       : num  -0.469 -0.685 -0.288 -0.986 -0.991 ...

 $ fBodyAccJerk_std_X        : num  -0.1336 -0.4619 -0.0863 -0.9875 -0.9951 ...

 $ fBodyAccJerk_std_Y        : num  0.107 -0.382 -0.135 -0.983 -0.987 ...

 $ fBodyAccJerk_std_Z        : num  -0.535 -0.726 -0.402 -0.988 -0.992 ...

 $ fBodyGyro_mean_X          : num  -0.339 -0.493 -0.352 -0.976 -0.986 ...

 $ fBodyGyro_mean_Y          : num  -0.1031 -0.3195 -0.0557 -0.9758 -0.989 ...

 $ fBodyGyro_mean_Z          : num  -0.2559 -0.4536 -0.0319 -0.9513 -0.9808 ...

 $ fBodyGyro_std_X           : num  -0.517 -0.566 -0.495 -0.978 -0.987 ...

 $ fBodyGyro_std_Y           : num  -0.0335 0.1515 -0.1814 -0.9623 -0.9871 ...

 $ fBodyGyro_std_Z           : num  -0.437 -0.572 -0.238 -0.944 -0.982 ...

 $ fBodyAccMag_mean_         : num  -0.1286 -0.3524 0.0966 -0.9478 -0.9854 ...

 $ fBodyAccMag_std_          : num  -0.398 -0.416 -0.187 -0.928 -0.982 ...

 $ fBodyBodyAccJerkMag_mean_ : num  -0.0571 -0.4427 0.0262 -0.9853 -0.9925 ...

 $ fBodyBodyAccJerkMag_std_  : num  -0.103 -0.533 -0.104 -0.982 -0.993 ...

 $ fBodyBodyGyroMag_mean_    : num  -0.199 -0.326 -0.186 -0.958 -0.985 ...

 $ fBodyBodyGyroMag_std_     : num  -0.321 -0.183 -0.398 -0.932 -0.978 ...

 $ fBodyBodyGyroJerkMag_mean_: num  -0.319 -0.635 -0.282 -0.99 -0.995 ...

 $ fBodyBodyGyroJerkMag_std_ : num  -0.382 -0.694 -0.392 -0.987 -0.995 ...
