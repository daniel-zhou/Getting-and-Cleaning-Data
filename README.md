## Introduction

This is a course project assignment of "Getting and Cleaning Data" course from Johns Hopkins University in Coursera. The R script called run_analysis.R does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to use run_analysis.R

1. Put run_analysis.R into the working directory
2. Run "source("run_analysis.R")" in RStudio
3. Use "data <- read.table("tidyDataSet.txt")" in RStudio to read the data. It is 180x68 because there are 30 subjects and 6 activities, thus "for each activity and each subject" means 30 * 6 = 180 rows. 
Note that the provided R script has no assumptions on numbers of records, only on locations of files.

## Dependencies

run_analysis.R file will help you to install the dependencies automatically. It depends on dplyr.