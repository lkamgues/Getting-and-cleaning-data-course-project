---
title: "CodeBook"
---

###**Data Collection**  
The original data set 'Human Activity Recognition Using Smartphones Dataset' was obtained from [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]   
It is built from the recordings of 30 volunteers performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while carrying a waist-mounted smartphone with embedded inertial sensors."  
The smartphone's accelerometer and gyroscope we used to capture 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  

###**Original dataset**

This section is taken directly from the "features_info.txt" file included with the original dataset.   
*"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.  
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.  
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).   
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."*

###**Transformation of the original data into the tidy data set**

In the original data set, each record contained a 561-feature vector with time and frequency domain variables, a subject identification as well as a label of the activity they performed.  
I have extracted the variables containing the "mean" and "standard deviation" resulting in a data set with subjectID, activity label and a 66 dimensional feature vector.  
This data set was then melted using subject ID and activity label as id variables giving a molten data set with 4 variables (subjectID, activity label, features and their value).  
Finally, since the experiment involved 30 subjects and each subject performed 6 different activities, the tidy dataset was obtained by casting the molten data set to compute the average of each feature for each activity and each subject

###**Variables in the tidy data set**

The tidy data set contains 68 variables:

- **subjectID**			Identifier of the subject who carried out the experiment

- **activity.type**		Label of  activity performed
				WALKING
				WALKING_UPSTAIRS
				WALKING_DOWNSTAIRS
 				SITTING
				STANDING
 				LAYING	
				
All features are the average of a measurement for each subject and activity. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


- **timeBodyAcc.mean.XYZ**		average of the time domain body acceleration mean "g"
- **timeGravityAcc.mean.XYZ**		average of the time domain gravity acceleration mean "g"
- **timeBodyAccJerk.mean.XYZ**		average of the body acceleration jerk mean "g"
- **timeBodyGyro.mean.XYZ**		average of the time domain angular velocity mean "radians/second"
- **timeBodyGyroJerk.mean.XYZ**	        average of the jerk angular velocity mean "radians/second"
- **timeBodyAccMag.mean**		average of the body acceleration magnitude mean "radians/second"
- **timeGravityAccMag.mean**		average of the gravity acceleration magnitude mean "g"
- **timeBodyAccJerkMag.mean**		average of the body acceleration jerk magnitude mean "g"
- **timeBodyGyroMag.mean**		average of the angular velogity magnitude mean "radians/second"
- **tBodyGyroJerkMag.mean**		average of the angular velocity jerk magnitude mean "radians/second"
- **freqBodyAcc.mean.XYZ**		average of the frequency domain body acceleration mean "g"
- **freqBodyAccJerk.mean.XYZ**		average of the frequency domain body acceleration jerk mean "g"
- **freqBodyGyro.mean.XYZ**		average of the frequency domain angular velocity mean "radians/second"
- **freqBodyAccMag.mean**		average of frequency domain body acceleration magnitude mean "g"
- **freqBodyBodyAccJerkMag.mean**	average of frequency domain body acceleration jerk magnitude mean "g"
- **freqBodyBodyGyroMag.mean**		average of frequency domain angular velocity magnitude mean "radians/second"
- **freqBodyBodyGyroJerkMag.mean**	average of frequency domain angular velocity jerk magnitude mean "radians/second"

- **timeBodyAcc.std.XYZ**		average of the time domain body acceleration std "g"
- **timeGravityAcc.std.XYZ**		average of the time domain gravity acceleration std "g"
- **timeBodyAccJerk.std.XYZ**		average of the body acceleration jerk std "g"
- **timeBodyGyro.std.XYZ**		average of the time domain angular velocity std "radians/second"
- **timeBodyGyroJerk.std.XYZ**		average of the jerk angular velocity std "radians/second" 
- **timeBodyAccMag.std**		average of the body acceleration magnitude std "g"
- **timeGravityAccMag.std**		average of the gravity acceleration magnitude std "g"
- **timeBodyAccJerkMag.std**		average of the body acceleration jerk magnitude std  "g"
- **timeBodyGyroMag.std**		average of the angular velogity magnitude std "radians/second"
- **tBodyGyroJerkMag.std**		average of the angular velocity jerk magnitude std "radians/second"
- **freqBodyAcc.std.XYZ**		average of the frequency domain body acceleration std "g"
- **freqBodyAccJerk.std.XYZ**		average of the frequency domain body acceleration jerk std "g"
- **freqBodyGyro.std.XYZ**		average of the frequency domain angular velocity std "radians/second"
- **freqBodyAccMag.std**		average of frequency domain body acceleration magnitude std "g"
- **freqBodyBodyAccJerkMag.std**	average of frequency domain body acceleration jerk magnitude std "g"
- **freqBodyBodyGyroMag.std**		average of frequency domain angular velocity magnitude std "radians/second"
- **freqBodyBodyGyroJerkMag.std**	average of frequency domain angular velocity jerk magnitude std "radians/second"