## Getting and Cleaning Data Course Project

Repository for the Coursera Getting and Cleaning Data course.

### Project Overview

This course project involves the tidying of some data of an experiment on Human Activity Recognition using Smartphone Data from the [UCI Machine Learning repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

For a description of what the R script does, please see the `codebook.md` file and comments in the R script itself.

### Project requirements

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

### Assumptions
* The code assumes that the data has been completely downloaded and unzipped in the project folder.

### Files in this repo

* run_analysis.R - The R script that merges and cleans all the data. It will also save a tidy table at the end.
* CodeBook.md - The code book for the tidy data
* README.md - This file
