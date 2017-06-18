library(dplyr)

#Load all data needed
# x_train <- read.table('train/X_train.txt')
# y_train <- read.table('train/y_train.txt')
# x_test <- read.table('test/X_test.txt')
# y_test <- read.table('test/y_test.txt')
# x_combined <- rbind(x_train, x_test)
# y_combined <- rbind(y_train, y_test)
# subject_train <- read.table('train/subject_train.txt')
# subject_test <- read.table('test/subject_test.txt')
# subject_combined <- rbind(subject_train, subject_test)
# activity_labels <- read.table('activity_labels.txt')
# features_info <- read.table('features.txt')
# features_info[1] <- NULL

#4 
#Appropriately labels the data set with descriptive variable names.
# colnames(x_combined) <- features_info[,1]
# colnames(subject_combined) <- c('subject_id')
# colnames(activity_labels) <- c('activity_id', 'activity_name')
# colnames(y_combined) <- c('activity_id')

#2
#Extracts only the measurements on the mean and standard deviation for each measurement.
# mean_and_std <- x_combined[grep('mean|std', names(x_combined))]


#3 
#Uses descriptive activity names to name the activities in the data set
# final_activityPeformed_vector <- merge(activity_labels, y_combined, by.x="activity_id", by.y="activity_id")


#5
# creates a second, independent tidy data set with the average of each variable for each activity and each subject.
all_combined <- cbind(mean_and_std, final_activityPeformed_vector, subject_combined)
groupedData <- dplyr::group_by(all_combined, activity_name, subject_id)
final_tidy_data <- summarize_each(groupedData, funs(mean))

