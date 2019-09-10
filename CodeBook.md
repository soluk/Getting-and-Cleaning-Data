# Code Book
This code book documents the methods and variables used in the script `run_analysis.R`

The link to the original dataset that is used can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the original dataset can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## The script
With the above data downloaded and unzipped in the working folder, the `run_analysis.R` script does the following:
1. Reads the data from the txt files in the UCI HAR Dataset folder
2. Binds the training and test data together
3. Selects mean and standard deviation measurements
4. Changes the activity codes to descriptive ones
5. Relabels the variable names with descriptive ones
6. Creates a data set with the average of each variable for each activity and subject, called tidydataset.txt in the working folder.

## Variables
Most of the variables are data frames read from the source data named as their respective text files. This includes `x_test`, `x_train`, `y_test`, `y_train`, `subject_test`, `subject_train`, `activities` (from activities_labels.txt), and `features`. This is performed in step 1.

Step 2 creates `x`, `y`, and `sj` from binding x, y, and subject data respectively. `data` is created from combining these three.

In steps 3-5, `tidy` is created by selecting from `data` the mean and standard deviation columns and is the working table in which the script relabels its columns using descriptive variables.

Finally, in step 6 `averages` uses `tidy` to create a new independent data set with the average of each variable for each activity and each subject.





