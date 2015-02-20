# download the dataset zip file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataFile <- "./data.zip"
download.file(fileUrl, dataFile)

# unzip the dataset zip file
unzip(dataFile, overwrite = TRUE)

# load the dplyr package
is.installed <- function(x) 
	is.element(x, installed.packages()[, 1])
if (!is.installed("dplyr")){
	install.packages("dplyr")
}
library(dplyr)

## Merges the training and the test sets to create one data set.
# load training data
trainingSubject <- data.frame(read.table("./UCI HAR Dataset/train/subject_train.txt"))
trainingLabel <- data.frame(read.table("./UCI HAR Dataset/train/y_train.txt"))
trainingSet <- data.frame(read.table("./UCI HAR Dataset/train/X_train.txt"))
# load test data
testSubject <- data.frame(read.table("./UCI HAR Dataset/test/subject_test.txt"))
testLabel <- data.frame(read.table("./UCI HAR Dataset/test/y_test.txt"))
testSet <- data.frame(read.table("./UCI HAR Dataset/test/X_test.txt"))
# merge dataset
trainingDataSet <- cbind(trainingSubject, trainingLabel, trainingSet)
testDataSet <- cbind(testSubject, testLabel, testSet)
dataSet <- rbind(trainingDataSet, testDataSet)
# clean temporary data
rm(trainingSubject)
rm(trainingLabel)
rm(trainingSet)
rm(testSubject)
rm(testLabel)
rm(testSet)
rm(trainingDataSet)
rm(testDataSet)

## Appropriately labels the data set with descriptive variable names. 
features <- read.table("./UCI HAR Dataset/features.txt")
varNames <- gsub("\\(\\)", "", features[, 2])
grpNames <- c("subject", "activity")
colnames(dataSet) <- c(grpNames, varNames)

## Extracts only the measurements on the mean and standard deviation for each measurement. 
# get the column list of mean and standard deviation features 
meanStdInds <- grep("mean[(]|std[(]", features[, 2])
# add 2 columns to the head of column list for subject and activity
meanStdDataSet <- dataSet[, c(1, 2, (meanStdInds + 2))]

## Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
meanStdDataSet <- mutate(meanStdDataSet, activity = activityLabels[activity, 2])

## Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyDataSet <- group_by(meanStdDataSet, subject, activity) %>% summarise_each( funs(mean) )
# update the col names indicating the average value for each Subject and Activity
labelNames <- colnames(tidyDataSet)[3:ncol(tidyDataSet)]
names(tidyDataSet) <- c(grpNames, paste("avg-", labelNames, sep=""))

write.table(tidyDataSet, "tidyDataSet.txt", row.name = FALSE)
