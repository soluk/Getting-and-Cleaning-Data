library(dplyr)

#read data from files
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#bind and select needed data
x <- rbind(x_train, x_test)
y <- rbind (y_train, y_test)
sj <- rbind(subject_train, subject_test)
data <- cbind(sj, y, x)
tidy <- data %>% select(subject, code, contains("mean"), contains("std"))

#relabel activity column + expand descriptors
names(tidy)[2] <- "activity"
tidy$activity <- activities[tidy$activity,2]
names(tidy) <- gsub("^f", "Freq", names(tidy))
names(tidy) <- gsub("^t", "Time", names(tidy))
names(tidy) <- gsub("tBody", "TimeBody", names(tidy))
names(tidy) <- gsub("Acc", "Accelerometer", names(tidy))
names(tidy) <- gsub("Gyro", "Gyroscope", names(tidy))
names(tidy) <- gsub("Mag", "Magnitude", names(tidy))

#create tidy averages table
averages <- tidy %>% 
            group_by(subject, activity) %>%
            summarize_all(mean)
            write.table(averages, "tidydataset.txt",row.name=FALSE)
