library(reshape2)
library(dplyr)
library(tidyr)

runAnalysis <- function() {
              containingFolder <- "UCI HAR Dataset"
              
              if (!file.exists(containingFolder)) {
                    print("Dataset not found in working directory")
                    print("Downloading data...")
                    zipFile <- tempfile()
                    download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', destfile=zipFile, method='curl')
                    
                    print("Extracting data from zip archive...")
                    unzip(zipFile, overwrite = TRUE)
                    print("Removing zip archive...")
                    unlink(zipFile) 
              }
              
              print("Reading files...")
              testData <- read.table(paste(containingFolder, 'test/X_test.txt', sep="/"))
              trainData <- read.table(paste(containingFolder, 'train/X_train.txt', sep='/'))
              testSubjects <- read.table(paste(containingFolder, 'test/subject_test.txt', sep='/'))
              trainSubjects <- read.table(paste(containingFolder, 'train/subject_train.txt', sep='/'))
              testActivity <- read.table(paste(containingFolder, 'test/y_test.txt', sep='/'))
              trainActivity <- read.table(paste(containingFolder, 'train/y_train.txt', sep='/'))
              
              features <- read.table(paste(containingFolder, 'features.txt', sep='/'))
              activityLabels <- read.table(paste(containingFolder, 'activity_labels.txt', sep='/'))

              print("Naming columns in datasets...")
              colnames(trainActivity) <- c("activity")
              colnames(testActivity) <- c("activity")
              colnames(testSubjects) <- c("subject")
              colnames(trainSubjects) <- c("subject")
              
              # More than one column have a measurement for the same feature.
              # Using make.names with unique=TRUE to avoid having more than one column
              # with the same name. 
              f <- as.character(features$V2)
              colnames(trainData) <- make.names(f, unique=TRUE)
              colnames(testData) <- make.names(f, unique=TRUE)
              
              
              print("Merging subjects, activity and data for training and test datasets...")
              xTrainCombined <- cbind(trainSubjects, trainActivity, trainData)
              xTestCombined <- cbind(testSubjects, testActivity, testData)
              
              print("Merging training and test datasets...")
              df.merged <- rbind(xTrainCombined, xTestCombined)
                            
              print("Extracting only the measurements on the mean and standard deviation for each measurement...")
              df.filtered <- select(df.merged, subject, activity, grep("\\.mean\\.|\\.std\\.", names(df.merged)))
              
              print("Setting activities to descriptive labels...")
              df.filtered$activity <- factor(df.filtered$activity, levels=activityLabels$V1, labels=activityLabels$V2)
              
              print("Reshaping data to create a data set with the average of each variable for each activity and each subject...")
              # All data described by features.txt are set to variables; subject and activity are defined as ids
              df.reshaped <- melt(df.filtered,id=c("subject","activity"),measure.vars=names(select(df.filtered, -subject, -activity)))
              
              # Calculating the mean of each feature grouped by activity and subject
              df.summarised <- summarise(group_by(df.reshaped, subject, activity, variable), mean=mean(value))
              
              print("Separating the average mean and the average standard deviation in their own column...")
              df.separate <- cbind(df.summarised, estimatedValue=sub('^.*(mean|std).*$', "\\1", df.summarised$variable))
              df.separate$variable = gsub('\\.*|mean|std', '', df.separate$variable)
              df.separate <- spread(df.separate, estimatedValue, mean)
              
              print("Cleaning up feature names...")
              df.tidy <- rename(df.separate, feature=variable)
              df.tidy <- rename(df.tidy, avgmean=mean)
              df.tidy <- rename(df.tidy, avgstd=std)
              df.tidy$feature <- sub('Acc', 'Acceleration', df.tidy$feature)
              df.tidy$feature <- sub('Mag', 'Magnitude', df.tidy$feature)
              df.tidy$feature <- sub('Gyro', 'AngularVelocity', df.tidy$feature)
              df.tidy$feature <- sub('BodyBody', 'Body', df.tidy$feature)
              df.tidy$feature <- sub('^t', 'time', df.tidy$feature)
              df.tidy$feature <- sub('^f', 'frequency', df.tidy$feature)
              
              print("Writing final dataset to file 'finalDataset.txt'...")
              write.table(df.tidy, "finalDataset.txt", row.name=FALSE)
}



