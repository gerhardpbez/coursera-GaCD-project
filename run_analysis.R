## run_analysis.R will complete step 1-5 of the course project
## 

# Loading required packages
library(reshape2)

# Downloading and unzipping data
filename <- "project_dataset.zip"
if(!file.exists(filename)) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                  , filename, method = "curl")
}
if(!file.exists("UCI HAR Dataset")) {
    unzip(filename)
}
rm(filename)

# Change directory to work in UCI HAR Dataset
workDir <- getwd()
workDir <- paste(workDir, "/UCI HAR Dataset", sep = "")
setwd(workDir)
rm(workDir)

# Load features datastet and extract data on mean and standard deviation
features <- read.table("features.txt")
features[,2] <- as.character(features[,2])
corrFeatures <- grep(".*mean.*|.*std.*", features[,2])
corrFeatNames <- features[corrFeatures,2]

# Making column names more discriptive
corrFeatNames = gsub("mean", "Mean", corrFeatNames)
corrFeatNames = gsub("std", "StandardDeviation", corrFeatNames)
corrFeatNames = gsub("BodyBody", "Body", corrFeatNames)
corrFeatNames = gsub("^f", "frequencyDomain", corrFeatNames)
corrFeatNames = gsub("^t", "timeDomain", corrFeatNames)
corrFeatNames = gsub("Acc", "Accelerometer", corrFeatNames)
corrFeatNames = gsub("Gyro", "Gyroscope", corrFeatNames)
corrFeatNames = gsub("Mag", "Magnitude", corrFeatNames)
corrFeatNames = gsub("Freq", "Frequency", corrFeatNames)
corrFeatNames <- gsub("[-()]", "", corrFeatNames)
rm(features)

# Load and bind X_train and Y_train datasets
train <- read.table("train/X_train.txt")[corrFeatures]
trainAct <- read.table("train/Y_train.txt")
trainSub <- read.table("train/subject_train.txt")
train <- cbind(trainSub, trainAct, train)
rm(trainSub, trainAct)

# Load and bind X_test and Y_test datasets
test <- read.table("test/X_test.txt")[corrFeatures]
testAct <- read.table("test/Y_test.txt")
testSub <- read.table("test/subject_test.txt")
test <- cbind(testSub, testAct, test)
rm(testSub, testAct, corrFeatures)

# Merging datasets
outData <- rbind(train, test)
rm(train, test)

# Appropriately labeling the dataset with descriptive variable names
colnames(outData) <- c("Subject", "Activity", corrFeatNames)
rm(corrFeatNames)

# Changing variables into factors
actLabels <- read.table("activity_labels.txt")
actLabels[,2] <- as.character(actLabels[,2])
outData$Activity <- factor(outData$Activity, levels = actLabels[,1],
                           labels = actLabels[,2])
outData$Subject <- as.factor(outData$Subject)
rm(actLabels)

# Melting data
outData_melted <- melt(outData, id = c("Subject", "Activity"))
rm(outData)

# Creating second independant dataset with averages of each variable for
# each activity and each subject
outData_averages <- dcast(outData_melted, Subject + Activity ~ variable, mean)
rm(outData_melted)
write.table(outData_averages, "tidy_data.txt", row.names = FALSE,
            quote = FALSE)

# All variables are deleted after use to ensure that memory is
# used efficiently