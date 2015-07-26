# Getting and Cleaning Data Course Project
# Submitted by Ashwan Lewis
# File name: run_analysis.R

# Set working directory
setwd("UCI HAR Dataset/")

# Read activity and features
features <- read.table("features.txt", stringsAsFactors = FALSE)
activities <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
colnames(activities) = c("activityID", "Activity")

# Read training data
trainX <- read.table("train/x_train.txt", stringsAsFactors = FALSE)
trainY <- read.table("train/y_train.txt", stringsAsFactors = FALSE)
subject_train <- read.table("train/subject_train.txt", stringsAsFactors = FALSE)
trainData <- cbind(trainY, subject_train, trainX)
remove(trainX, trainY, subject_train)

# Read test data
testX <- read.table("test/x_test.txt", stringsAsFactors = FALSE)
testY <- read.table("test/y_test.txt", stringsAsFactors = FALSE)
subject_test <- read.table("test/subject_test.txt", stringsAsFactors = FALSE)
testData <- cbind(testY, subject_test, testX)
remove(testX, testY, subject_test)

# Merge training and test data
allData <- rbind(trainData,testData)

# Add column names from the features table
colnames(allData) <- c("activityID", "SubjectID", features[,2])
remove(testData, trainData)

# Create a logical vector of columns with 'mean' or 'std' in their name
columnNames <- grepl("mean\\(\\)", features[,2]) | grepl("std\\(\\)", features[,2])

# Adding two TRUEs for the activityID and subject ID that we're keeping
columnNames <- c(TRUE, TRUE, columnNames)

# Subset to only keep the columns we want using the the logical vector we created earlier
allData <- allData[,columnNames]

# Merge the activity names into our data
allData <- merge(allData, activities, by="activityID")

# Create a data frame with the mean of all the data by activity and subject
tidyData <- aggregate(allData[,3:68], list(ActivityID = allData$ActivityID, SubjectID = allData$SubjectID), mean)

# Add the activity name back to our tidy data
tidyData<-merge(tidyData, activities, by="activityID")

# Export the tidyData set 
write.table(tidyData, '../tidyData.csv',row.name=FALSE,sep=',')
