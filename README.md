# Getting_Cleaning_Data_Course_Project
Repository for the Course Project of Getting Cleaning Data class

##Pre-requisites:

* Dataset zip file, available at:

  <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

  For more information about:
  
  * The files inside the zip file - Check README.txt inside the zip file.
  * This dataset - contact: activityrecognition@smartlab.ws

  Reference and Credits:

  [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

* The "dplyr" library is needed to the script work properly. If it's not installed yet, enter the command below at R console:

        install.packages("dplyr")

##Steps to run the script and get the generated file:

1. Extract the zip file in the top level of the target directory (without subdirectories).

 **Note that the directory structure used here is different from that one inside the zip file** (that have some files inside "test" and "train" subdirectories).
 
 The following files will be processed by the main script `run_analysis.R` and **must be on the top level of the target directory**:
 
 * X_train.txt - Training set.
 * X_test.txt - Test set.
 * features.txt - List of all features.
 * y_train.txt - Training labels.
 * y_test.txt - Test labels.
 * activity_labels.txt - Links the class labels with their activity name.
 * subject_train.txt - Each row identifies the subject who performed the **train** activity for each window sample. Its range is from 1 to 30.
 * subject_test.txt - Each row identifies the subject who performed the **test** activity for each window sample. Its range is from 1 to 30.

2. Download the script [run_analysis.R](/run_analysis.R) and save it in the target directory;

3. Into R console, Set the target directory as the working directory and run the script `run_analysis.R`, like the following example:

        setwd("<put_your_target_directory_here>")
        source("run_analysis.R")

 The script do the following tasks:

 * Merges the training and the test sets to create one data set;
 * Extracts only the measurements on the mean and standard deviation for each measurement;
 * Uses descriptive activity names to name the activities in the data set;
 * Appropriately labels the data set with descriptive variable names;
 * From the data set in the previous task, creates a second, independent tidy data set with the average of each variable.

4. At the end of the execution, a file called "**Getting_Cleaning_Data_Course_Project.txt**" will be saved into the working directory.

For each record it is provided:

* A 79-feature vector with the mean of the time and frequency domain variables (grouped by activity and subject); Check [CodeBook](/CodeBook.md) for more info.
* Its activity name.
* An identifier of the subject who carried out the experiment.

Notes:

* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.
