# Getting_and_Cleaning_Data_Project

# Code Book for the Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. This project uses the data collected from the accelerometers from the Samsung Galaxy S smartphone. 

Data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Description of the data: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


The R script - run_analysis.R performs the following to clean up the data:

1. Merges the training and the test sets to create one data set.
   * Read subject_train.txt, X_train.txt and y_train.txt files from  "./UCI HAR Dataset/train/" folder and save them as the variables subjectDS(10299x1 data frame), DS (10299x561 data frame) and activityDS (10299x1 data frame) respectively.
   
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
   * Read features.txt file from "./UCI HAR Dataset/" and store the data in a variable called features.
   * Subset only meaurements for the mean and standard deviation for each measurement. This returns a list of 66 indices.
   * The result is a subset of DS with the 66 corresponding columns.
   * Clean the names by removing "()" and change "-" to "_"
   
3.Uses descriptive activity names to name the activities in the data set
  * Read activity_labels.txt file from "./UCI HAR Dataset/" and store the data in a variable called activities.
  * Clean the column names by removing "()" and convert all letters to lowercase
  * Name activityDS as "activity".
  
4.Appropriately labels the data set with descriptive variable names. 
  * Name subjectDS as "subject".
  * Combine jsubjectDS, DS and activityDS by column to get a new cleaned 10299x68 data frame called cleanedData. The "subject" column are integers between 1 to 30 inclusive. The "activity" column contains 6 kinds of activity names.  The last 66 columns are measurements.
  * The cleanedData is saved as "merged_dataset.txt".
  
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  * The script creates a second, independent tidy 180x68 data frame called result. It contains average of each measurement for each activity and each subject. The result is saved as "average_dataset.txt". The first column "subject" contains subject IDs; the second column "activity" contains activity names, and then the averages for each of the 66 attributes.  Since there are 30 subjects and 6 activities, there are 30*6=180 rows in this data set.

