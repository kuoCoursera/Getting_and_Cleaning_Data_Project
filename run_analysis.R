# References:
# Description of data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# Source of data : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


# run_analysis.R does the following:
##===============================================================
# 1. Merges the training and the test sets to create one data set.

## Read subject files and merge to one data set
StrainingSet <- read.table("UCI HAR Dataset/train/subject_train.txt")  
StestSet <- read.table("UCI HAR Dataset/test/subject_test.txt")
subjectDS <- rbind(StrainingSet, StestSet)

## Read data files and merge to one data set
XtrainingSet <- read.table("UCI HAR Dataset/train/X_train.txt")
XtestSet <- read.table("UCI HAR Dataset/test/X_test.txt")
DS <- rbind(XtrainingSet, XtestSet)

## Read activity files and merge to one data set
YtrainingSet <- read.table("UCI HAR Dataset/train/y_train.txt")
YtestSet <- read.table("UCI HAR Dataset/test/y_test.txt")
activityDS <- rbind(YtrainingSet, YtestSet)

##===============================================================
# 2. Extracts only the measurements on the mean and standard deviation for 
#    each measurement.

## Read featureS.txt file
features <- read.table("UCI HAR Dataset/features.txt")

## Subset only measurements for the mean and standard deviation.
meanStdIndices <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
DS <- DS[, meanStdIndices]

names(DS) <- gsub("\\(|\\)", "",features[meanStdIndices, 2])  # remove "()" 
names(DS) <- gsub("-", "_", names(DS)) # change "-" to "_" in column names

##===============================================================
# 3. Uses descriptive activity names to name the activities in the data set.

## Read activity_labels.txt file
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities[, 2] <- tolower(gsub("_", "", activities[, 2])) #remove () and _ and convert all letters to lowercase
activityDS[, 1] <- activities[activityDS[, 1], 2]
names(activityDS) <- "activity"

##===============================================================
# 4. Appropriately labels the data set with descriptive activity names.

names(subjectDS) <- "subject"
cleanedData <- cbind(subjectDS, activityDS, DS)
write.table(cleanedData, "merged_dataset.txt") # write out the 1st dataset

##===============================================================
# 5.From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.
uniqueSubjects <- unique(subjectDS)[,1]
subjectLen <- length(uniqueSubjects)
activityLen  <- dim(activities)[1]
columnLen <- dim(cleanedData)[2]
result <- cleanedData[1:(subjectLen*activityLen), ]

row <- 1
for (sub in 1:subjectLen) {
        for (act in 1:activityLen) {
                result[row, 1] = uniqueSubjects[sub]
                result[row, 2] = activities[act, 2]
                result[row, 3:columnLen] <-colMeans(cleanedData[cleanedData$subject==sub & cleanedData$activity==activities[act, 2], 3:columnLen])
                row = row+1
        }
}
head(result)
write.table(result, "average_dataset.txt") # write out the 2nd dataset
