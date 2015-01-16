Codebook
======
## Transormations ##
run_analysis.R was created using RStudio Version 0.98.1091 in R version 3.1.2

The original data set was split into two groups for machine learning purposes:

 1. Train
 2. Test

Each of these sets was split into a 561 feature vector, activity label, and subject ID.  

Using `rbind()`, the train/test feature vector, train/test activity label, and train/test subject ID data.frames are merged.

Using `colnames()`, descriptive variable names arethen added to the columns in each of the three data subsets.

Then, only the columns from the feature vector that describe a mean or standard deviation are extracted using `select()` from the `dplyr` package.

Finally, the three subsets are merged into one data.frame, such that `subject.id` is the first column, `activity` is the second column, and the remaining columns from the feature vector.  This 10299 by 88 data.frame is stored as `humanActivity` in the script.

The activity labels were coded as an integer between 1 and 6, so they are transformed into a factor vector with six levels corresponding to the activity.  The explicit correlation can be found in the "Variables" section below.

The subset data.frames are removed from the workspace by the `rm()` function.

From the `humanActivity` data.frame a new tidy table is created.  Each mean or standard deviation variable from the original feature vector is averaged (numerical mean) by subject and by activity.  This tidy data set is written as a space delimited, text file named "means by subject by activity.txt"

One can reproduce the tidy data text file by downloading the UCI HAR Dataset folder from the repo into your working directory and running run_analysis.R.  Upon completion, the text file should be written to your working directory.

## Variables ##

With the exception of the first two variables - subject.id & activity - variables describe either the mean or standard deviation of transformed signals from the accelerometer or gyroscope.  Prefixes and Suffixes are used to describe what is being summarized.

###Prefixes###

 - **time:** normalized time signals collected at 50 Hz
 - **frequency.domain:**  Fast Fourier Transformed frequency domain signals
 - **angle:**  angle between vectors
 - **.body:** body measurements obtained by subtracting the gravity acceleration from the total acceleration
 - **.gravity:** acceleration due to gravity
 - **.accerlerometer:**  signal collected from the accelerometer of the smartphone
 - **.gyrometer:**  signal collected from the gyroscope of the smartphone

###Suffixes###

 - **.jerk:**  signal derived from linear body acceleration and angular velocity
 - **.Magnitude:**  magnitude of 3-dimensional signal vector
 - **.mean:**  arithmetic mean
 - **.stdev:**  standard deviation
 - **.X/  .Y  /.Z.axis:**  One of three axial components of the signal vector

[1] "subject.id"

> A unique identification number for each subject from which data was collected.

[2] "activity"

> One of six activities performed by the subjects:

 1. walking
 2. walking upstairs
 3. walking downstairs
 4. sitting
 5. standing
 6. laying

[3] "time.body.accelerometer.mean.X.axis"

[4] "time.body.accelerometer.mean.Y.axis"

[5] "time.body.accelerometer.mean.Z.axis"

[6] "time.gravity.accelerometer.mean.X.axis"

[7] "time.gravity.accelerometer.mean.Y.axis"

[8] "time.gravity.accelerometer.mean.Z.axis"

[9] "time.body.accelerometer.jerk.mean.X.axis"

[10] "time.body.accelerometer.jerk.mean.Y.axis"

[11] "time.body.accelerometer.jerk.mean.Z.axis"

[12] "time.body.gyrometer.mean.X.axis"

[13] "time.body.gyrometer.mean.Y.axis"

[14] "time.body.gyrometer.mean.Z.axis"

[15] "time.body.gyrometer.jerk.mean.X.axis"

[16] "time.body.gyrometer.jerk.mean.Y.axis"

[17] "time.body.gyrometer.jerk.mean.Z.axis"

[18] "time.body.accelerometer.magnitude.mean"

[19] "time.gravity.accelerometer.magnitude.mean"

[20] "time.body.accelerometer.jerk.magnitude.mean"

[21] "time.body.gyrometer.magnitude.mean"

[22] "time.body.gyrometer.jerk.magnitude.mean"

[23] "frequency.domain.body.accelerometer.mean.X.axis"

[24] "frequency.domain.body.accelerometer.mean.Y.axis"

[25] "frequency.domain.body.accelerometer.mean.Z.axis"

[26] "frequency.domain.body.accelerometer.meanFreq...X"

[27] "frequency.domain.body.accelerometer.meanFreq...Y"

[28] "frequency.domain.body.accelerometer.meanFreq...Z"

[29] "frequency.domain.body.accelerometer.jerk.mean.X.axis"

[30] "frequency.domain.body.accelerometer.jerk.mean.Y.axis"

[31] "frequency.domain.body.accelerometer.jerk.mean.Z.axis"

[32] "frequency.domain.body.accelerometer.jerk.meanFreq...X"

[33] "frequency.domain.body.accelerometer.jerk.meanFreq...Y"

[34] "frequency.domain.body.accelerometer.jerk.meanFreq...Z"

[35] "frequency.domain.body.gyrometer.mean.X.axis"

[36] "frequency.domain.body.gyrometer.mean.Y.axis"

[37] "frequency.domain.body.gyrometer.mean.Z.axis"

[38] "frequency.domain.body.gyrometer.meanFreq...X"

[39] "frequency.domain.body.gyrometer.meanFreq...Y"

[40] "frequency.domain.body.gyrometer.meanFreq...Z"

[41] "frequency.domain.body.accelerometer.magnitude.mean"

[42] "frequency.domain.body.accelerometer.magnitude.meanFreq.."

[43] "frequency.domain.body.accelerometer.jerk.magnitude.mean"

[44] "frequency.domain.body.accelerometer.jerk.magnitude.meanFreq.."

[45] "frequency.domain.body.gyrometer.magnitude.mean"

[46] "frequency.domain.body.gyrometer.magnitude.meanFreq.."

[47] "frequency.domain.body.gyrometer.jerk.magnitude.mean"

[48] "frequency.domain.body.gyrometer.jerk.magnitude.meanFreq.."

[49] "angle.time.body.accelerometerMean..gravity."

[50] "angle.time.body.accelerometer.jerkMean...gravityMean."

[51] "angle.time.body.gyrometerMean..gravityMean."

[52] "angle.time.body.gyrometer.jerkMean..gravityMean."

[53] "angle.X..gravityMean."

[54] "angle.Y..gravityMean."

[55] "angle.Z..gravityMean."

[56] "time.body.accelerometer.stdev.X.axis"

[57] "time.body.accelerometer.stdev.Y.axis"

[58] "time.body.accelerometer.stdev.Z.axis"

[59] "time.gravity.accelerometer.stdev.X.axis"

[60] "time.gravity.accelerometer.stdev.Y.axis"

[61] "time.gravity.accelerometer.stdev.Z.axis"

[62] "time.body.accelerometer.jerk.stdev.X.axis"

[63] "time.body.accelerometer.jerk.stdev.Y.axis"

[64] "time.body.accelerometer.jerk.stdev.Z.axis"

[65] "time.body.gyrometer.stdev.X.axis"

[66] "time.body.gyrometer.stdev.Y.axis"

[67] "time.body.gyrometer.stdev.Z.axis"

[68] "time.body.gyrometer.jerk.stdev.X.axis"

[69] "time.body.gyrometer.jerk.stdev.Y.axis"

[70] "time.body.gyrometer.jerk.stdev.Z.axis"

[71] "time.body.accelerometer.magnitude.stdev"

[72] "time.gravity.accelerometer.magnitude.stdev"

[73] "time.body.accelerometer.jerk.magnitude.stdev"

[74] "time.body.gyrometer.magnitude.stdev"

[75] "time.body.gyrometer.jerk.magnitude.stdev"

[76] "frequency.domain.body.accelerometer.stdev.X.axis"

[77] "frequency.domain.body.accelerometer.stdev.Y.axis"

[78] "frequency.domain.body.accelerometer.stdev.Z.axis"

[79] "frequency.domain.body.accelerometer.jerk.stdev.X.axis"

[80] "frequency.domain.body.accelerometer.jerk.stdev.Y.axis"

[81] "frequency.domain.body.accelerometer.jerk.stdev.Z.axis"

[82] "frequency.domain.body.gyrometer.stdev.X.axis"

[83] "frequency.domain.body.gyrometer.stdev.Y.axis"

[84] "frequency.domain.body.gyrometer.stdev.Z.axis"

[85] "frequency.domain.body.accelerometer.magnitude.stdev"

[86] "frequency.domain.body.accelerometer.jerk.magnitude.stdev"

[87] "frequency.domain.body.gyrometer.magnitude.stdev"

[88] "frequency.domain.body.gyrometer.jerk.magnitude.stdev"

## Data ##
*From the original dataset README:*

Human Activity Recognition Using Smartphones Dataset

Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Università degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domains.
