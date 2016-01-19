# run_analysis.R
# 
# Getting and Cleaning data course project
# 01/18/2016, Peter Shen
#
# Class assignment project.
# The project data set is already downloaded to the target directory below.

# set working directory to the location where the UCI HAR Dataset was unzipped
setwd('/Users/shenp/dataScience/Getting and Cleaning Data/UCI HAR Dataset/');

# Read in the data from files
features = read.table('./features.txt',header=FALSE)
activityType = read.table('./activity_labels.txt',header=FALSE)

# Read in the training data
subjectTrain = read.table('./train/subject_train.txt',header=FALSE)
xTrain = read.table('./train/x_train.txt',header=FALSE)
yTrain = read.table('./train/y_train.txt',header=FALSE)

# Read in the test data
subjectTest = read.table('./test/subject_test.txt',header=FALSE)
xTest = read.table('./test/x_test.txt',header=FALSE)
yTest = read.table('./test/y_test.txt',header=FALSE)

# 1. Merges the training and the test sets to create one data set.

# create 'x' data set
xData <- rbind(xTrain, xTest)

# create 'y' data set
yData <- rbind(yTrain, yTest)

# create 'subject' data set
subjectData <- rbind(subjectTrain, subjectTest)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

#    Extracts only mean() and std(), not including meanFreq() and such.
featuresNeeded <- grep("-(mean|std)\\(\\)", features[, 2])
xData <- xData[, featuresNeeded]

# 3. Uses descriptive activity names to name the activities in the data set.

# replace values with activity names in yData
yData[, 1] <- activityType[yData[, 1], 2]

# 4. Appropriately labels the data set with descriptive variable names.

# add column header names to xData
fnames <- features[featuresNeeded, 2]
fnames <- gsub("[-()]", "", fnames)
names(xData) <- fnames
# add column header name to yData
names(yData) <- "activity"
# add column header name to subjectData
names(subjectData) <- "subject"

# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

# bind all data into a single data set
sensorData <- cbind(xData, yData, subjectData)

# taking average of the 66 columns of xData, not including activity and subject.
library(plyr)
averages <- ddply(sensorData, .(subject, activity), function(x) colMeans(x[, 1:66]))

# write out to tidy_average.txt
write.table(averages, "tidy_averages.txt", row.name = FALSE, quote = FALSE)
