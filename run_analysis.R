## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation 
##      for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
###########################################################################

# load packages
library(dplyr)
library(plyr)

# Read the data
fileXtest <- "./UCI HAR Dataset/test/X_test.txt"
fileYtest <- "./UCI HAR Dataset/test/y_test.txt"
fileSubTest <- "./UCI HAR Dataset/test/subject_test.txt"
fileXtrain <- "./UCI HAR Dataset/train/X_train.txt"
fileYtrain <- "./UCI HAR Dataset/train/y_train.txt"
fileSubTrain <- "./UCI HAR Dataset/train/subject_train.txt"
fileLabels <- "./UCI HAR Dataset/variable_labels.txt" #Descriptors for variables

xTest.df <- read.table(fileXtest)
yTest.df <- read.table(fileYtest)
subTest.df <- read.table(fileSubTest)
xTrain.df <- read.table(fileXtrain)
yTrain.df <- read.table(fileYtrain)
subTrain.df <- read.table(fileSubTrain)
lbls <- read.table(fileLabels)

# Merge Test and Training Sets (Observations)
x.df <- rbind(xTest.df, xTrain.df)
y.df <- rbind(yTest.df, yTrain.df)
subject.df <- rbind(subTest.df, subTrain.df)

# Rename Variables with Descriptive Names
colnames(x.df) <- make.names(lbls$V2, unique=TRUE)
colnames(y.df) <- c("activity")
colnames(subject.df) <- c("subject.id")

# Extract mean and standard deviation variables
x.df <- select(x.df, contains("mean"), contains("stdev"))

# Merge Data Frames (Variables)
humanActivity <- cbind(subject.df, y.df, x.df)

# Descriptively label activities
activities <- c('walking', 
                'walking upstairs', 
                'walking downstairs', 
                'sitting', 
                'standing', 
                'laying')
humanActivity$activity <- factor(humanActivity$activity, labels=activities)

# Remove unmerged data frames from memory
rm(xTest.df, yTest.df, subTest.df, xTrain.df, yTrain.df, subTrain.df, lbls,
   x.df, y.df, subject.df)

# Create new tidy table
means.df <- ddply(humanActivity, .(subject.id, activity), numcolwise(mean))
file = "means by subject by activity.txt"
write.table(means.df, file=file, row.names=FALSE)
