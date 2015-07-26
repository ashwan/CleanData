## Code Book for Getting and Cleaning Data Course Project

### Overview

The course project uses data from the [UCI Machine Learning repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The script `run_analysis.R` in this repo attempts to read, merge and clean the data as per the course requirements

### Reading and Merging data

* Both test and training data were read into tables. Column names for the variables were obtained from `features.txt`
* Activity id was read from `test_y.txt` and `train_y.txt` (using `cbind()`)
* Subject id was read from `subject_test.txt` and `subject_train.txt` (using `cbind()`)
* The test and training data was then merged into a single data frame (using `rbind()`)

### Uses descriptive activity names

* Read the activity names and ids from `activity_lables.txt`
* `merge()` with the main data frame using the activity id to assign the correct activity name

### Subset to only the mean and standard deviation variables

* Used `grepl` on the column names to create a logical vector to subset the data frame
* Made sure to keep the activity ID and subject ID intact in our subset

### Create an independent data set with the average of each variable

* `aggregate()` the main data set by activity ID and subject ID and using the `mean()` function
* Add the activity name to new data set using `merge()`
* Use `write.table()` to output this tidy data set to a `.txt` file

### Variable descriptions
