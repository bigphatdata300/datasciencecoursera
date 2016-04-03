## Install dplyr and plyr packages used in the script
library(plyr)
library(dplyr)

## Read in descriptive tables. Requires that the descriptive files are in the
## working directory
feature <- read.table("features.txt", 
                        col.names = c("featurenum","featuredescription"))
activity <- read.table("activity_labels.txt", 
                        col.name = c("activitynum","activitydescription"))

## Extracts column indexes for mean, sd metrics
means <- grep("mean[^F]",feature$featuredescription)
stds <- grep("std", feature$featuredescription)

## Build training dataset. This requires that the files are in a folder
## called 'train' in the working directory
subjecttrain <- read.table("./train/subject_train.txt", 
                             col.names = c("subject"))
ytrain <- read.table("./train/y_train.txt", 
                      col.names = c("activitynum"))
xtrain <- read.table("./train/x_train.txt")
                      names(xtrain) <- feature$featuredescription

    ## Append activity and subgroup descripitons              
    ytrain2 <- merge(ytrain, activity)
    ytrain2 <- mutate(ytrain2, subgroup = "train")

    ## extract data for mean, sd metrics
    xmeans <- xtrain[,means]
    xstds <- xtrain[,stds]

    ## combine subject, activity, means, and stds data
    train <- cbind(subjecttrain,ytrain2,xmeans,xstds)

## Build test dataset. This requires that the files are in a folder
## called 'test' in the working directory
subjecttest <- read.table("./test/subject_test.txt", 
                               col.names = c("subject"))
    ytest <- read.table("./test/y_test.txt", 
                              col.names = c("activitynum"))
    xtest <- read.table("./test/x_test.txt")
                    names(xtest) <- feature$featuredescription
    
    ## Append activity and subgroup descripitons              
    ytest2 <- merge(ytest, activity)
    ytest2 <- mutate(ytest2, subgroup = "test")
                    
    ## extract data for mean, sd metrics
    xmeans <- xtest[,means]
    xstds <- xtest[,stds]
                    
    ## combine subject, activity, means, and stds data
    test <- cbind(subjecttest,ytest2,xmeans,xstds)

## Combine test and train datasets
alldata <- rbind(train,test)

## Create summary table of means by subject and activity
groups <- names(alldata)[1:3]
metrics <- names(alldata)[-(1:4)]
results = ddply(alldata, groups, function(x) colMeans(x[metrics]))
