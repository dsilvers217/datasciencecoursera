This is a code book describing the data contained in the tidy dataset for this course project.

The data originally came from a project which collected data from smart phones as user performed various physical activities. A link to the description of the experiment is here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data originally contained 561 columns of data, containing the various types of data collected. In the original dataset the columns were not labeled, but there was a code book with titles for each column in order of appearance in the table. The full list is available  with two additional columns containing the ID of the User and a code for the type of physical activity performed. 

We have cut out all but the data columns containing information on the means and standard deviations. Below is the description from the original analysis explaining the data collected, along with the names of the columns which are kept in the tidy dataset. These explain the form of the data.




Feature Selection
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).




tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z

tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z

tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z

tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z

tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z

tBodyAccMag-mean()
tBodyAccMag-std()

tGravityAccMag-mean()
tGravityAccMag-std()

tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()

tBodyGyroMag-mean()
tBodyGyroMag-std()

tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()

fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z

fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z

fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z

fBodyAccMag-mean()
fBodyAccMag-std()

fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()

fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()

fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()














