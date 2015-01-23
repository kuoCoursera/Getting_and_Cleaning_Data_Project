# Getting_and_Cleaning_Data_Project

# Instuction of running the Course Project 

1. Put run_analysis.R to user's local directory 
   e.g. C:\docs\mydir\run_analysis.R

2. Unzip the source folder (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
   into the same directory as the R script was saved. 
   e.g. C:\docs\mydir\UCI HAR Dataset

3. In RStudio, set the working directory to the folder where the R script file was saved using setwd() function. 
   e.g. setwd("c:/docs/mydir")

4. Type: source("run_analysis.R")
	 This command will run the R script and it normally runs for ~30 seconds.

	
OUTPUT: Two output files will be generated in the current working directory:

	 • merged_data.txt (8.1Mb): appropriately labels the data set with descriptive variable names. 
	   It contains a 10299 x 68  data frame. 
	 
	 • average_data.txt (0.2Mb): data set with the average of each variable for each activity and 
	   each subject. It contains a 180 x 68 data frame. Note:30 subjects*6 activities= 180 rows.

