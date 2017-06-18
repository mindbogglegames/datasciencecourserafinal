library(dplyr)

if(!dir.exists("./UCI HAR Dataset")) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, "dataset.zip", method="curl")
    unzip("dataset.zip")
}


#Load all data needed
x_train <- read.table('UCI HAR Dataset/train/X_train.txt')
y_train <- read.table('UCI HAR Dataset/train/y_train.txt')
x_test <- read.table('UCI HAR Dataset/test/X_test.txt')
y_test <- read.table('UCI HAR Dataset/test/y_test.txt')
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')
subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt')
activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt')
features_info <- read.table('UCI HAR Dataset/features.txt')

#Remove unused first column
features_info[1] <- NULL

#1
#Merges the training and the test sets to create one data set.
x_combined <- rbind(x_train, x_test)
y_combined <- rbind(y_train, y_test)
subject_combined <- rbind(subject_train, subject_test)

#2 
#Appropriately labels the data set with descriptive variable names.
colnames(x_combined) <- features_info[,1]
colnames(subject_combined) <- c('subject_id')
colnames(activity_labels) <- c('activity_id', 'activity_name')
colnames(y_combined) <- c('activity_id')

#3
#Extracts only the measurements on the mean and standard deviation for each measurement.
mean_and_std <- x_combined[grep('mean|std', names(x_combined))]


#4 
#Uses descriptive activity names to name the activities in the data set
activityMerge <- merge(activity_labels, y_combined, by.x="activity_id", by.y="activity_id")


#5
# creates a second, independent tidy data set with the average of each variable for each activity and each subject.
all_combined <- cbind(mean_and_std, activityMerge, subject_combined)
groupedData <- dplyr::group_by(all_combined, activity_name, subject_id)
final_tidy_data <- summarize_each(groupedData, funs(mean))

write.table(final_tidy_data, "tidy.txt", row.names = FALSE, quote = FALSE)