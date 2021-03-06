#Code Book

##First Notes

* The variables described here are derived from the ones described into features_info.txt and features.txt from the UCI original dataset.

  Link: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

* Compared to the original dataset, the variable names from the dataset generated by the script `run_analysis.R` were modified as follows:

    * First, the characters `(` and `)` were removed;
    * After, the character `-` was replaced by the character `.`.

  For example, **tBodyAcc-mean()-X** was converted to **tBodyAcc.mean.X**.

* In summary, the dataset variable names respect the following pattern:

        <avg><domain><type><sensor><jerk><magnitude><measurement><axis>

 Where:

 * `<avg>` Indicates that is an average of the variable grouped by `activity_name` and `subject` variables;
 * `<domain>` Can be ***time*** (t) or ***frequency*** (f) domain;
 * `<type>` Can be ***Body*** or ***Gravity*** type;
 * `<sensor>` Can be ***Acc*** (accelerometer) or ***Gyro*** (gyroscope) sensor;
 * `<jerk>` (OPTIONAL) Indicates if it is a jerk signal;
 * `<magnitude>` (OPTIONAL) Indicates if it is a magnitude signal;
 * `<measurement>` Can be ***mean*** (mean), ***standard deviation*** (std) or ***frequency mean*** (meanFreq) measurement;
 * `<axis>` (OPTIONAL) Can be ***X***, ***Y*** or ***Z*** axis;

 Example 1: ***avg.tBodyAcc.mean.X*** (`<avg><domain><type><sensor><measurement><axis>` pattern)

 * ***avg***: Average indicator
 * ***t***: Time domain
 * ***Body***: Body type
 * ***Acc***: Accelerometer sensor
 * ***mean***: Mean measurement
 * ***X***: X axis

 Example 2: ***avg.tBodyGyroJerkMag.mean*** (***<avg><domain><type><sensor><jerk><magnitude><measurement>*** pattern)

 * ***avg***: Average indicator
 * ***t***: Time domain
 * ***Body***: Body type
 * ***Gyro***: Gyroscope sensor
 * ***Jerk***: Jerk signal
 * ***Mag***: Magnitude signal
 * ***mean***: Mean measurement

 **Note:** The two exceptions are the `activity_name` and `subject` variables, used to group by them all the other variables.

##Dataset Variables

* activity_name
    * Name of the activity. Can be one of the following:

        * WALKING
        * WALKING_UPSTAIRS
        * WALKING_DOWNSTAIRS
        * SITTING
        * STANDING
        * LAYING

* subject
    * Identifies the subject who performed the activity for each window sample.
        * 1..30 .Subject ID

* avg.tBodyAcc.mean.X
    * Aggregate average of the variable `tBodyAcc.mean.X` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyAcc.mean.Y
    * Aggregate average of the variable `tBodyAcc.mean.Y` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyAcc.mean.Z
    * Aggregate average of the variable `tBodyAcc.mean.Z` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyAcc.std.X
    * Aggregate average of the variable `tBodyAcc.std.X` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyAcc.std.Y
    * Aggregate average of the variable `tBodyAcc.std.Y` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyAcc.std.Z
    * Aggregate average of the variable `tBodyAcc.std.Z` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tGravityAcc.mean.X
    * Aggregate average of the variable `tGravityAcc.mean.X` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tGravityAcc.mean.Y
    * Aggregate average of the variable `tGravityAcc.mean.Y` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tGravityAcc.mean.Z
    * Aggregate average of the variable `tGravityAcc.mean.Z` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tGravityAcc.std.X
    * Aggregate average of the variable `tGravityAcc.std.X` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tGravityAcc.std.Y
    * Aggregate average of the variable `tGravityAcc.std.Y` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tGravityAcc.std.Z
    * Aggregate average of the variable `tGravityAcc.std.Z` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyAccJerk.mean.X
    * Aggregate average of the variable `tBodyAccJerk.mean.X` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyAccJerk.mean.Y
    * Aggregate average of the variable `tBodyAccJerk.mean.Y` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyAccJerk.mean.Z
    * Aggregate average of the variable `tBodyAccJerk.mean.Z` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyAccJerk.std.X
    * Aggregate average of the variable `tBodyAccJerk.std.X` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyAccJerk.std.Y
    * Aggregate average of the variable `tBodyAccJerk.std.Y` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyAccJerk.std.Z
    * Aggregate average of the variable `tBodyAccJerk.std.Z` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyGyro.mean.X
    * Aggregate average of the variable `tBodyGyro.mean.X` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyGyro.mean.Y
    * Aggregate average of the variable `tBodyGyro.mean.Y` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyGyro.mean.Z
    * Aggregate average of the variable `tBodyGyro.mean.Z` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyGyro.std.X
    * Aggregate average of the variable `tBodyGyro.std.X` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyGyro.std.Y
    * Aggregate average of the variable `tBodyGyro.std.Y` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyGyro.std.Z
    * Aggregate average of the variable `tBodyGyro.std.Z` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyGyroJerk.mean.X
    * Aggregate average of the variable `tBodyGyroJerk.mean.X` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyGyroJerk.mean.Y
    * Aggregate average of the variable `tBodyGyroJerk.mean.Y` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyGyroJerk.mean.Z
    * Aggregate average of the variable `tBodyGyroJerk.mean.Z` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyGyroJerk.std.X
    * Aggregate average of the variable `tBodyGyroJerk.std.X` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyGyroJerk.std.Y
    * Aggregate average of the variable `tBodyGyroJerk.std.Y` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyGyroJerk.std.Z
    * Aggregate average of the variable `tBodyGyroJerk.std.Z` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyAccMag.mean
    * Aggregate average of the variable `tBodyAccMag.mean` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyAccMag.std
    * Aggregate average of the variable `tBodyAccMag.std` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tGravityAccMag.mean
    * Aggregate average of the variable `tGravityAccMag.mean` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tGravityAccMag.std
    * Aggregate average of the variable `tGravityAccMag.std` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyAccJerkMag.mean
    * Aggregate average of the variable `tBodyAccJerkMag.mean` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyAccJerkMag.std
    * Aggregate average of the variable `tBodyAccJerkMag.std` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyGyroMag.mean
    * Aggregate average of the variable `tBodyGyroMag.mean` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyGyroMag.std
    * Aggregate average of the variable `tBodyGyroMag.std` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyGyroJerkMag.mean
    * Aggregate average of the variable `tBodyGyroJerkMag.mean` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.tBodyGyroJerkMag.std
    * Aggregate average of the variable `tBodyGyroJerkMag.std` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAcc.mean.X
    * Aggregate average of the variable `fBodyAcc.mean.X` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAcc.mean.Y
    * Aggregate average of the variable `fBodyAcc.mean.Y` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAcc.mean.Z
    * Aggregate average of the variable `fBodyAcc.mean.Z` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAcc.std.X
    * Aggregate average of the variable `fBodyAcc.std.X` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAcc.std.Y
    * Aggregate average of the variable `fBodyAcc.std.Y` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAcc.std.Z
    * Aggregate average of the variable `fBodyAcc.std.Z` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAcc.meanFreq.X
    * Aggregate average of the variable `fBodyAcc.meanFreq.X` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAcc.meanFreq.Y
    * Aggregate average of the variable `fBodyAcc.meanFreq.Y` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAcc.meanFreq.Z
    * Aggregate average of the variable `fBodyAcc.meanFreq.Z` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAccJerk.mean.X
    * Aggregate average of the variable `fBodyAccJerk.mean.X` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAccJerk.mean.Y
    * Aggregate average of the variable `fBodyAccJerk.mean.Y` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAccJerk.mean.Z
    * Aggregate average of the variable `fBodyAccJerk.mean.Z` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAccJerk.std.X
    * Aggregate average of the variable `fBodyAccJerk.std.X` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAccJerk.std.Y
    * Aggregate average of the variable `fBodyAccJerk.std.Y` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAccJerk.std.Z
    * Aggregate average of the variable `fBodyAccJerk.std.Z` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAccJerk.meanFreq.X
    * Aggregate average of the variable `fBodyAccJerk.meanFreq.X` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAccJerk.meanFreq.Y
    * Aggregate average of the variable `fBodyAccJerk.meanFreq.Y` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAccJerk.meanFreq.Z
    * Aggregate average of the variable `fBodyAccJerk.meanFreq.Z` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyGyro.mean.X
    * Aggregate average of the variable `fBodyGyro.mean.X` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyGyro.mean.Y
    * Aggregate average of the variable `fBodyGyro.mean.Y` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyGyro.mean.Z
    * Aggregate average of the variable `fBodyGyro.mean.Z` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyGyro.std.X
    * Aggregate average of the variable `fBodyGyro.std.X` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyGyro.std.Y
    * Aggregate average of the variable `fBodyGyro.std.Y` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyGyro.std.Z
    * Aggregate average of the variable `fBodyGyro.std.Z` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyGyro.meanFreq.X
    * Aggregate average of the variable `fBodyGyro.meanFreq.X` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyGyro.meanFreq.Y
    * Aggregate average of the variable `fBodyGyro.meanFreq.Y` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyGyro.meanFreq.Z
    * Aggregate average of the variable `fBodyGyro.meanFreq.Z` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAccMag.mean
    * Aggregate average of the variable `fBodyAccMag.mean` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAccMag.std
    * Aggregate average of the variable `fBodyAccMag.std` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyAccMag.meanFreq
    * Aggregate average of the variable `fBodyAccMag.meanFreq` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyBodyAccJerkMag.mean
    * Aggregate average of the variable `fBodyBodyAccJerkMag.mean` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyBodyAccJerkMag.std
    * Aggregate average of the variable `fBodyBodyAccJerkMag.std` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyBodyAccJerkMag.meanFreq
    * Aggregate average of the variable `fBodyBodyAccJerkMag.meanFreq` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyBodyGyroMag.mean
    * Aggregate average of the variable `fBodyBodyGyroMag.mean` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyBodyGyroMag.std
    * Aggregate average of the variable `fBodyBodyGyroMag.std` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyBodyGyroMag.meanFreq
    * Aggregate average of the variable `fBodyBodyGyroMag.meanFreq` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyBodyGyroJerkMag.mean
    * Aggregate average of the variable `fBodyBodyGyroJerkMag.mean` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyBodyGyroJerkMag.std
    * Aggregate average of the variable `fBodyBodyGyroJerkMag.std` from the generated dataset, grouped by the variables `activity_name` and `subject`

* avg.fBodyBodyGyroJerkMag.meanFreq
    * Aggregate average of the variable `fBodyBodyGyroJerkMag.meanFreq` from the generated dataset, grouped by the variables `activity_name` and `subject`

