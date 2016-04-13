## Install dplyr and plyr packages used in the script
library(plyr)
library(dplyr)

## Read in descriptive tables. Requires that the descriptive files are in the
## working directory
feature <- read.table("features.txt", 
                        col.names = c("featurenum","featuredescription"))
activity <- read.table("activity_labels.txt", 
                        col.name = c("activitynum","activitydescription"))

## Extract column indexes for mean, sd metrics
kpi <- grep("std|mean[^F]", feature$featuredescription)

## Build training dataset with activity descriptions. 
## This requires that the files are in a folder "./train" in the working directory.
subjecttrain <- read.table("./train/subject_train.txt", 
                             col.names = c("subject"))

ytrain <- read.table("./train/y_train.txt", 
                      col.names = c("activitynum"))
      ytrain2 <- join(ytrain, activity, 
                    by = "activitynum", 
                    type = "left",
                    match = "all")
      ytrain2 <- mutate(ytrain2, subgroup = "train")

xtrain <- read.table("./train/x_train.txt")
      names(xtrain) <- feature$featuredescription
      xtrain2 <- xtrain[,kpi]
    
train <- cbind(subjecttrain,ytrain2,xtrain2)

## Build test dataset. This requires that the files are in a folder
## called 'test' in the working directory
subjecttest <- read.table("./test/subject_test.txt", 
                               col.names = c("subject"))

ytest <- read.table("./test/y_test.txt", 
                              col.names = c("activitynum"))
        ytest2 <- join(ytest, activity, 
                    by = "activitynum", 
                    type = "left",
                    match = "all")
        ytest2 <- mutate(ytest2, subgroup = "test")

xtest <- read.table("./test/x_test.txt")
        names(xtest) <- feature$featuredescription
        xtest2 <- xtest[,kpi]
                    
test <- cbind(subjecttest,ytest2,xtest2)

## Combine test and train datasets
## Tidy feature names
alldata <- rbind(train,test)
        names(alldata) <- gsub("[[:punct:]]+","_",names(alldata))

## Create summary table of means by subject and activity
groups <- names(alldata)[1:3]
metrics <- names(alldata)[-(1:4)]
results = ddply(alldata, groups, function(x) colMeans(x[metrics]))

## Write results
write.table(x = results, file = "results.txt", row.names = FALSE)
