## Data Source
Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set and Variable Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
The six activities are obtained by reading activity_labels.txt and applied in the data set.

* dataSet: A 10299x563 data frame is obtained by merging the training and test sets to create one data set, including train/X_train.txt, train/y_train.txt, train/subject_train.txt, test/X_test.txt, test/y_test.txt, test/subject_test.txt
* features: A 561x1 data frame is obtained from reading features.txt for measurements
* meanStdInds: A 66x1 data frame is obtained the measurements on the mean and standard deviation in features.
* meanStdDataSet: A 10299x68 data frame is obtained by extracting the meansurements on the mean and standard deviation, subject and activities.
* tidyDataSet: A 180x68 data frame is finally created as independent tidy data set with the average of each measurement for each activity and each subject. The result is saved as tidyDataSet.txt, where the first column contains subject IDs, the second column contains activity names (brackets() are removed), and then the averages for each of the 66 attributes are in columns 3...68.

## Transformation details
There are 5 parts:
* Merges the training and the test sets to create one data set, including subject and activities.
* Appropriately labels the data set with descriptive variable names, removing the brackets.
* Extracts only the measurements on the mean and standard deviation for each measurement, by subletting the mean and standard deviation columns.
* Uses descriptive activity names to name the activities in the data set, by replacing the activity ID by activity labels
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject, by group_by and summarise_each, and attach "avg_" in labels to standard for average value.