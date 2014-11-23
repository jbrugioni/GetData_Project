GetData_Project
===============

JHU Getting and Cleaning Data course project


Data Processing
===============


The data was obtained from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  


The README for the data is repeated at the bottom of this file.  


The run_analysis.R script has entire procedure used to generate described below.   



For this subset of the original data the more raw Inertial data was ignored.   To generate a combined data set the subject, X and y files for both test and train were combined row wise and column wise to make this structure:    


  
 .............................................

  subject_train   |   X_train   |    y_train
  
 .............................................
  
  
  subject_test    |    X_test   |    y_test  
  
 .............................................   
 
    
The combined X data, y data and subject data were output to files as part of the final data package.   

Using grep the columns containing the means of sensor measurements were extracted.  Columns that were frequency means and involved angle calculations (typicaly based on a ratio or two sensors) were NOT extracted.  The columns contained standard deviations of sensors were also extracted.  The number of columns of means is equal to the columns of standard deviations.  These were combined with the subject data and the activity data as:


...................................................  
  
  subject  |   activity   |    means     |    sds
  
...................................................  
    
The activity's were translated from numerical values to descriptive test using the labels contained in the activity_labels.txt file.  The columns were named based on the names in the features.txt file.   This data was written to the measurements.txt file.  
  
    
The means for each of the sensor mean and sd columns were then obtained, grouped by activity and subject.  The prefix "MEAN_" was prepended to every column name to distinguish this new data.  This was structured as:



...........................................................................   
  
  subject  |   activity   |    MEAN_(means)     |    MEAN_(sds)
  
...........................................................................    

   
   
   
   
This data was output to the tidy_data.txt file.   The columns in the tidy_data.file are:  
   
   
 [1] "subj"                             "activity"                         "MEAN_tBodyAcc-mean()-X"          
 [4] "MEAN_tBodyAcc-mean()-Y"           "MEAN_tBodyAcc-mean()-Z"           "MEAN_tGravityAcc-mean()-X"       
 [7] "MEAN_tGravityAcc-mean()-Y"        "MEAN_tGravityAcc-mean()-Z"        "MEAN_tBodyAccJerk-mean()-X"      
[10] "MEAN_tBodyAccJerk-mean()-Y"       "MEAN_tBodyAccJerk-mean()-Z"       "MEAN_tBodyGyro-mean()-X"         
[13] "MEAN_tBodyGyro-mean()-Y"          "MEAN_tBodyGyro-mean()-Z"          "MEAN_tBodyGyroJerk-mean()-X"     
[16] "MEAN_tBodyGyroJerk-mean()-Y"      "MEAN_tBodyGyroJerk-mean()-Z"      "MEAN_tBodyAccMag-mean()"         
[19] "MEAN_tGravityAccMag-mean()"       "MEAN_tBodyAccJerkMag-mean()"      "MEAN_tBodyGyroMag-mean()"        
[22] "MEAN_tBodyGyroJerkMag-mean()"     "MEAN_fBodyAcc-mean()-X"           "MEAN_fBodyAcc-mean()-Y"          
[25] "MEAN_fBodyAcc-mean()-Z"           "MEAN_fBodyAccJerk-mean()-X"       "MEAN_fBodyAccJerk-mean()-Y"      
[28] "MEAN_fBodyAccJerk-mean()-Z"       "MEAN_fBodyGyro-mean()-X"          "MEAN_fBodyGyro-mean()-Y"         
[31] "MEAN_fBodyGyro-mean()-Z"          "MEAN_fBodyAccMag-mean()"          
[33] "MEAN_fBodyBodyAccJerkMag-mean()"  
[34] "MEAN_fBodyBodyGyroMag-mean()"     "MEAN_fBodyBodyGyroJerkMag-mean()" "MEAN_tBodyAcc-std()-X"           
[37] "MEAN_tBodyAcc-std()-Y"            "MEAN_tBodyAcc-std()-Z"            "MEAN_tGravityAcc-std()-X"        
[40] "MEAN_tGravityAcc-std()-Y"         "MEAN_tGravityAcc-std()-Z"         "MEAN_tBodyAccJerk-std()-X"       
[43] "MEAN_tBodyAccJerk-std()-Y"        "MEAN_tBodyAccJerk-std()-Z"        "MEAN_tBodyGyro-std()-X"          
[46] "MEAN_tBodyGyro-std()-Y"           "MEAN_tBodyGyro-std()-Z"           "MEAN_tBodyGyroJerk-std()-X"      
[49] "MEAN_tBodyGyroJerk-std()-Y"       "MEAN_tBodyGyroJerk-std()-Z"       "MEAN_tBodyAccMag-std()"          
[52] "MEAN_tGravityAccMag-std()"        "MEAN_tBodyAccJerkMag-std()"       "MEAN_tBodyGyroMag-std()"         
[55] "MEAN_tBodyGyroJerkMag-std()"      "MEAN_fBodyAcc-std()-X"            "MEAN_fBodyAcc-std()-Y"           
[58] "MEAN_fBodyAcc-std()-Z"            "MEAN_fBodyAccJerk-std()-X"        "MEAN_fBodyAccJerk-std()-Y"       
[61] "MEAN_fBodyAccJerk-std()-Z"        "MEAN_fBodyGyro-std()-X"           "MEAN_fBodyGyro-std()-Y"          
[64] "MEAN_fBodyGyro-std()-Z"           "MEAN_fBodyAccMag-std()"           "MEAN_fBodyBodyAccJerkMag-std()"  
[67] "MEAN_fBodyBodyGyroMag-std()"      "MEAN_fBodyBodyGyroJerkMag-std()" 

















Original Readme
==================================================================

==================================================================

Human Activity Recognition Using Smartphones Dataset
Version 1.0

==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
-------------------------------

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
-------------------------------

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
------
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
--------
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.








