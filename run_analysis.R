# Pre-requisites:
#
# - This script must be run under "UCI HAR Dataset" directory, keeping all directory structure inside the zip file when extract it.
#
library(dplyr)
#
# Step 1. Merges the training and the test sets to create one data set.
#
# To accomplish this step, I analysed the files and got the number of rows and the class of each column for each file.
# With this info, I opened the x_train and x_test files in an optimal way.
# After that, I merged the two data frames by row.
#
x_train <- read.table("./X_train.txt", colClasses = "numeric", nrows = 7352, comment.char = "")
x_test <- read.table("./X_test.txt", colClasses = "numeric", nrows = 2947, comment.char = "")
dataset <- rbind(x_train, x_test)

# Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#
# To accomplish this step, first, I create a "features" data frame with the content of the features file.
# After, I rename its two variable names and created another data frame called "selected_features" with only the rows of the "features" data frame
# that have the string "mean" or "std" into features$name variable value.
# After, for each value of the variable "selected_features$name", I removed the characters "(" and ")"
# and replace the character "-" by the character ".", to avoid syntax errors during average calculation.
# Finally, I used the variable "selected_features$id" to subset the desired variables into "dataset" data frame.
#
features <- read.table("./features.txt", colClasses = c("numeric", "character"), nrows = 561, comment.char = "")
names(features) <- c("id", "name")
selected_features <- features[grepl("(mean|std)" , features$name), ]
selected_features$name <- gsub("-", ".", gsub("\\(\\)", "", selected_features$name))
dataset <- dataset[, selected_features$id]

# Step 3. Uses descriptive activity names to name the activities in the data set
#
# To accomplish this step, first, I created a data frame ("y_dataset") merging the y_train and y_test files by row.
# After, I opened the activity_labels file and replaced into "y_dataset" data frame the value of each row with his descriptive activity name.
# After, to avoid variable name conflict with the "dataset" data frame, I renamed the variable accordingly.
# Otherwise, I'd have two "V1" variable names after joining the "y_dataset" data frame with the "dataset" data frame.
# Finally, I joined the data frames by column.
#
y_train <- read.table("./y_train.txt", colClasses = "numeric", nrows = 7352, comment.char = "")
y_test <- read.table("./y_test.txt", colClasses = "numeric", nrows = 2947, comment.char = "")
y_dataset <- rbind(y_train, y_test)
activity_labels <- read.table("./activity_labels.txt", colClasses = c("numeric", "character"), nrows = 6, comment.char = "")
y_dataset$V1 <- activity_labels[y_dataset$V1, 2]
names(y_dataset) <- "activity_name"
dataset <- cbind(dataset, y_dataset)

# Step 4. Appropriately labels the data set with descriptive variable names.
#
# To accomplish this step, I use the "name" variable from the "selected_features" data frame, subsetting the "dataset" names vector to avoid overwrite the "activity_name" variable name.
# The meaning of each variable name is described in the code book.
#
names(dataset)[seq_along(selected_features$name)] <- selected_features$name

# Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable
#         for each activity and each subject.
#
# To accomplish this step, first, I created the "subject_dataset" data frame merging the subject_train and subject_test files by row.
# After, I renamed the variable accordingly and joined the "subject_dataset" and "dataset" data frames by column.
# After, using dplyr to group the data by each activity and each subject and gather the averages as required, I created the "final_dataset" data frame.
# Finally, I wrote the "final_dataset" data frame to a file called "Getting_Cleaning_Data_Course_Project.txt".
#
subject_train <- read.table("./subject_train.txt", colClasses = "numeric", nrows = 7352, comment.char = "")
subject_test <- read.table("./subject_test.txt", colClasses = "numeric", nrows = 2947, comment.char = "")
subject_dataset <- rbind(subject_train, subject_test)
names(subject_dataset) <- "subject"
dataset <- cbind(dataset, subject_dataset)
activity_subject <- group_by(dataset, activity_name, subject)
final_dataset <- summarize(activity_subject, avg.tBodyAcc.mean.X = mean(tBodyAcc.mean.X, na.rm = TRUE),
                                             avg.tBodyAcc.mean.Y = mean(tBodyAcc.mean.Y, na.rm = TRUE),
                                             avg.tBodyAcc.mean.Z = mean(tBodyAcc.mean.Z, na.rm = TRUE),
                                             avg.tBodyAcc.std.X = mean(tBodyAcc.std.X, na.rm = TRUE),
                                             avg.tBodyAcc.std.Y = mean(tBodyAcc.std.Y, na.rm = TRUE),
                                             avg.tBodyAcc.std.Z = mean(tBodyAcc.std.Z, na.rm = TRUE),
                                             avg.tGravityAcc.mean.X = mean(tGravityAcc.mean.X, na.rm = TRUE),
                                             avg.tGravityAcc.mean.Y = mean(tGravityAcc.mean.Y, na.rm = TRUE),
                                             avg.tGravityAcc.mean.Z = mean(tGravityAcc.mean.Z, na.rm = TRUE),
                                             avg.tGravityAcc.std.X = mean(tGravityAcc.std.X, na.rm = TRUE),
                                             avg.tGravityAcc.std.Y = mean(tGravityAcc.std.Y, na.rm = TRUE),
                                             avg.tGravityAcc.std.Z = mean(tGravityAcc.std.Z, na.rm = TRUE),
                                             avg.tBodyAccJerk.mean.X = mean(tBodyAccJerk.mean.X, na.rm = TRUE),
                                             avg.tBodyAccJerk.mean.Y = mean(tBodyAccJerk.mean.Y, na.rm = TRUE),
                                             avg.tBodyAccJerk.mean.Z = mean(tBodyAccJerk.mean.Z, na.rm = TRUE),
                                             avg.tBodyAccJerk.std.X = mean(tBodyAccJerk.std.X, na.rm = TRUE),
                                             avg.tBodyAccJerk.std.Y = mean(tBodyAccJerk.std.Y, na.rm = TRUE),
                                             avg.tBodyAccJerk.std.Z = mean(tBodyAccJerk.std.Z, na.rm = TRUE),
                                             avg.tBodyGyro.mean.X = mean(tBodyGyro.mean.X, na.rm = TRUE),
                                             avg.tBodyGyro.mean.Y = mean(tBodyGyro.mean.Y, na.rm = TRUE),
                                             avg.tBodyGyro.mean.Z = mean(tBodyGyro.mean.Z, na.rm = TRUE),
                                             avg.tBodyGyro.std.X = mean(tBodyGyro.std.X, na.rm = TRUE),
                                             avg.tBodyGyro.std.Y = mean(tBodyGyro.std.Y, na.rm = TRUE),
                                             avg.tBodyGyro.std.Z = mean(tBodyGyro.std.Z, na.rm = TRUE),
                                             avg.tBodyGyroJerk.mean.X = mean(tBodyGyroJerk.mean.X, na.rm = TRUE),
                                             avg.tBodyGyroJerk.mean.Y = mean(tBodyGyroJerk.mean.Y, na.rm = TRUE),
                                             avg.tBodyGyroJerk.mean.Z = mean(tBodyGyroJerk.mean.Z, na.rm = TRUE),
                                             avg.tBodyGyroJerk.std.X = mean(tBodyGyroJerk.std.X, na.rm = TRUE),
                                             avg.tBodyGyroJerk.std.Y = mean(tBodyGyroJerk.std.Y, na.rm = TRUE),
                                             avg.tBodyGyroJerk.std.Z = mean(tBodyGyroJerk.std.Z, na.rm = TRUE),
                                             avg.tBodyAccMag.mean = mean(tBodyAccMag.mean, na.rm = TRUE),
                                             avg.tBodyAccMag.std = mean(tBodyAccMag.std, na.rm = TRUE),
                                             avg.tGravityAccMag.mean = mean(tGravityAccMag.mean, na.rm = TRUE),
                                             avg.tGravityAccMag.std = mean(tGravityAccMag.std, na.rm = TRUE),
                                             avg.tBodyAccJerkMag.mean = mean(tBodyAccJerkMag.mean, na.rm = TRUE),
                                             avg.tBodyAccJerkMag.std = mean(tBodyAccJerkMag.std, na.rm = TRUE),
                                             avg.tBodyGyroMag.mean = mean(tBodyGyroMag.mean, na.rm = TRUE),
                                             avg.tBodyGyroMag.std = mean(tBodyGyroMag.std, na.rm = TRUE),
                                             avg.tBodyGyroJerkMag.mean = mean(tBodyGyroJerkMag.mean, na.rm = TRUE),
                                             avg.tBodyGyroJerkMag.std = mean(tBodyGyroJerkMag.std, na.rm = TRUE),
                                             avg.fBodyAcc.mean.X = mean(fBodyAcc.mean.X, na.rm = TRUE),
                                             avg.fBodyAcc.mean.Y = mean(fBodyAcc.mean.Y, na.rm = TRUE),
                                             avg.fBodyAcc.mean.Z = mean(fBodyAcc.mean.Z, na.rm = TRUE),
                                             avg.fBodyAcc.std.X = mean(fBodyAcc.std.X, na.rm = TRUE),
                                             avg.fBodyAcc.std.Y = mean(fBodyAcc.std.Y, na.rm = TRUE),
                                             avg.fBodyAcc.std.Z = mean(fBodyAcc.std.Z, na.rm = TRUE),
                                             avg.fBodyAcc.meanFreq.X = mean(fBodyAcc.meanFreq.X, na.rm = TRUE),
                                             avg.fBodyAcc.meanFreq.Y = mean(fBodyAcc.meanFreq.Y, na.rm = TRUE),
                                             avg.fBodyAcc.meanFreq.Z = mean(fBodyAcc.meanFreq.Z, na.rm = TRUE),
                                             avg.fBodyAccJerk.mean.X = mean(fBodyAccJerk.mean.X, na.rm = TRUE),
                                             avg.fBodyAccJerk.mean.Y = mean(fBodyAccJerk.mean.Y, na.rm = TRUE),
                                             avg.fBodyAccJerk.mean.Z = mean(fBodyAccJerk.mean.Z, na.rm = TRUE),
                                             avg.fBodyAccJerk.std.X = mean(fBodyAccJerk.std.X, na.rm = TRUE),
                                             avg.fBodyAccJerk.std.Y = mean(fBodyAccJerk.std.Y, na.rm = TRUE),
                                             avg.fBodyAccJerk.std.Z = mean(fBodyAccJerk.std.Z, na.rm = TRUE),
                                             avg.fBodyAccJerk.meanFreq.X = mean(fBodyAccJerk.meanFreq.X, na.rm = TRUE),
                                             avg.fBodyAccJerk.meanFreq.Y = mean(fBodyAccJerk.meanFreq.Y, na.rm = TRUE),
                                             avg.fBodyAccJerk.meanFreq.Z = mean(fBodyAccJerk.meanFreq.Z, na.rm = TRUE),
                                             avg.fBodyGyro.mean.X = mean(fBodyGyro.mean.X, na.rm = TRUE),
                                             avg.fBodyGyro.mean.Y = mean(fBodyGyro.mean.Y, na.rm = TRUE),
                                             avg.fBodyGyro.mean.Z = mean(fBodyGyro.mean.Z, na.rm = TRUE),
                                             avg.fBodyGyro.std.X = mean(fBodyGyro.std.X, na.rm = TRUE),
                                             avg.fBodyGyro.std.Y = mean(fBodyGyro.std.Y, na.rm = TRUE),
                                             avg.fBodyGyro.std.Z = mean(fBodyGyro.std.Z, na.rm = TRUE),
                                             avg.fBodyGyro.meanFreq.X = mean(fBodyGyro.meanFreq.X, na.rm = TRUE),
                                             avg.fBodyGyro.meanFreq.Y = mean(fBodyGyro.meanFreq.Y, na.rm = TRUE),
                                             avg.fBodyGyro.meanFreq.Z = mean(fBodyGyro.meanFreq.Z, na.rm = TRUE),
                                             avg.fBodyAccMag.mean = mean(fBodyAccMag.mean, na.rm = TRUE),
                                             avg.fBodyAccMag.std = mean(fBodyAccMag.std, na.rm = TRUE),
                                             avg.fBodyAccMag.meanFreq = mean(fBodyAccMag.meanFreq, na.rm = TRUE),
                                             avg.fBodyBodyAccJerkMag.mean = mean(fBodyBodyAccJerkMag.mean, na.rm = TRUE),
                                             avg.fBodyBodyAccJerkMag.std = mean(fBodyBodyAccJerkMag.std, na.rm = TRUE),
                                             avg.fBodyBodyAccJerkMag.meanFreq = mean(fBodyBodyAccJerkMag.meanFreq, na.rm = TRUE),
                                             avg.fBodyBodyGyroMag.mean = mean(fBodyBodyGyroMag.mean, na.rm = TRUE),
                                             avg.fBodyBodyGyroMag.std = mean(fBodyBodyGyroMag.std, na.rm = TRUE),
                                             avg.fBodyBodyGyroMag.meanFreq = mean(fBodyBodyGyroMag.meanFreq, na.rm = TRUE),
                                             avg.fBodyBodyGyroJerkMag.mean = mean(fBodyBodyGyroJerkMag.mean, na.rm = TRUE),
                                             avg.fBodyBodyGyroJerkMag.std = mean(fBodyBodyGyroJerkMag.std, na.rm = TRUE),
                                             avg.fBodyBodyGyroJerkMag.meanFreq = mean(fBodyBodyGyroJerkMag.meanFreq, na.rm = TRUE))
write.table(final_dataset, file = "./Getting_Cleaning_Data_Course_Project.txt", row.names = FALSE)
#
# Alternatively, you can write a file with ungrouped data to check the result via a spreadsheet software like MS-Excel:
#
#   write.table(dataset, file = "reference_dataset.csv", row.names = FALSE, sep = ";", quote = FALSE)
#
# Or use sqldf to check the "dataset" data frame using SQL and comparing to the "final_dataset" data frame:
#
#   head(sqldf("select activity_name, subject, avg(tBodyAccmeanX) from dataset group by activity_name, subject"))
#
