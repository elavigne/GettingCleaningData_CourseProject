# Getting and Cleaning Data - Course Project

## Description
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

The data analyzed and transformed for this project was taken from the UCI Human Activity Recognition Using Smartphones Data Set found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The description of the dataset can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones )

## Requirements
Create one R script called run_analysis.R that does the following:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How to run the analysis
To run the analysis on the data, execute the following:
```
> source('run_analysis.R')
> runAnalysis()
```
The script will print out to the console the steps it executes.

## What the analysis does
1. Download the dataset if necessary

 If the extracted dataset is not present in the working directory (folder name 'UCI HAR Dataset' when extracted form the zip file) the script will download a new copy [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ) and extract it to your working directory.
 
2. Read the data

  The script will read the following files:
  -  test/X_test.txt
  -  train/X_train.txt
  -  test/subject_test.txt
  -  train/subject_train.txt
  -  test/y_test.txt
  -  train/y_train.txt
  -  features.txt
  -  activity_labels.txt
  
  Note that this step can take a few seconds. Be patient!

3. Assign column names to all data

  The features in 'features.txt' will be applied as column names to both 'test/X_test.txt' and 'train/X_train.txt'. The column name 'subject' will be applied to 'test/subject_test.txt' and 'train/subject_train.txt'. The column name 'activity' will be applied to 'test/y_test.txt' and 'train/y_train.txt'.

4. Merge all the test data in one dataframe, and all train data in another

   Using cbind, the columns from the subject data read from 'test/subject_test.txt', the activity data read from 'test/y_test.txt' and the measured signals read from 'test/X_test.txt' will be merged in one dataset. The train dataframe will be created similarly.

5. Merge train and test data in one dataframe

  Using rbind, train and test data will be merged into a single dataframe.
  
6. Filter out any column whose feature name does not contain 'mean' and 'std'

  This filter is case sensitive since we are only interested in mean and std, but not in meanFreq values.
  
7. Transform activity numbers into descriptive labels
    
   Each activity number is matched to a row in the table read from 'activity_labels.txt' and is replaced by the string value found in that row.

8. Reshape the dataframe to obtain the mean of each feature grouped by subject and activity.

  The transformation is executed using reshape2's melt method followed by the dplyr's summarise method.

9. The column variable is renamed to 'feature'
10. The values in the column features are cleaned renamed to be more descriptive
  
  The '.' are removed from the names, and partial words are renamed to their full word: 
  - Acc is renamed to Acceleration
  - Mag is renamed to Magnitude
  - BodyBody is renamed to Body
  - t is renamed to time
  - f is renamed to frequency
  - mean is renamed to Mean
  - std is renamed to StandardDeviation
  
  The final names are in camel case to ease readability.

11. Write the final output to 'finalDataset.txt'

  You can read the file as follows:
  ```
  > read.table('finalDataset.txt', head=TRUE)
  ```
