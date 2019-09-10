# Getting-and-Cleaning-Data
*Course Project*

This repo contains an R script and a codebook for the Getting and Cleaning Data course project in Coursera. 

The link to the dataset that was used is found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the above dataset can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

With the above data downloaded and unzipped in the working folder, the `run_analysis.R` script does the following:
1. Reads the data from the txt files in the UCI HAR Dataset folder
2. Binds the training and test data together
3. Selects mean and standard deviation measurements
4. Changes the activity codes to descriptive ones
5. Relabels the variable names with descriptive ones
6. Creates a data set with the average of each variable for each activity and subject, called `tidydataset.txt` in the working folder.

`CodeBook.md` describes the variables, the data, and any transformations or work that was performed to clean up the data.
