# Getting and Cleaning Data Course Project

setwd("C:/Users/larys_000/Desktop/Coursera/getdata course project/UCI HAR Dataset")
library(plyr)
library(dplyr)
library(reshape2)
########################STEP 1#######################################
####Merges the training and the test sets to create one data set#####

# read train sets, attach labels and subject id columns to train set
train_set <- read.table("./train/X_train.txt")
train_labels <- read.table("./train/Y_train.txt")
subject_train <- read.table("./train/subject_train.txt")
train <- cbind(subject_train, train_labels,train_set)

# read test sets and attach labels and subject id columns to test set
test_set <- read.table("./test/X_test.txt")
test_labels <- read.table("./test/Y_test.txt")
subject_test <- read.table("./test/subject_test.txt")
test <- cbind(subject_test, test_labels,test_set)

# Merge the training and the test sets to create one data set
train_test <- rbind(train,test)

########################STEP 2#######################################
#Extract only the measurements on the mean and standard deviation for each measurement##

# read the features and return as a vector the index of columns containing -mean or -std

features <- read.table("features.txt")
features_names <- as.vector(features[,2])
selection <- as.vector(grep("-(mean|std)\\(\\)", features_names))

# attach names to labels and subject id columns
colnames(train_test)[1:2] <- c("subjectID","activity.type")

# increment selection by 2 since features started at the third column
# extract subject ID, activity.type columns and selected features from the train_test dataset
data <- select(train_test, subjectID, activity.type, (selection +2))

########################STEP 3#######################################
##Use descriptive activity names to name the activities in the data set##

activity_labels <- read.table("activity_labels.txt")
data$activity.type <- as.factor(data$activity.type)
levels(data$activity.type) <-as.vector(activity_labels[,2])

########################STEP 4#######################################
##Appropriately label the data set with descriptive variable names##

selection <- as.vector(grep("-(mean|std)\\(\\)", features_names, value=TRUE))
names(data)[3:68] <- selection
# replace all hyphens '-' with dots '.' in the variable names
names(data) <- gsub("-", ".", names(data))
# replace all the beginning 't' and 'f' with time and freq 
names(data) <- gsub('^t','time.', names(data)) 
names(data) <- gsub('^f','freq.',names(data)) 
# strip off all trailing '()' 
names(data) <- sub("\\(\\)$", "", names(data)) 
names(data) <- sub("\\(\\)", "",names(data))

########################STEP 5#######################################
##create a second, independent tidy data set with the average of each 
##variable for each activity and each subject##

mdata <-melt(data,id=c("subjectID","activity.type"))
ddata <- dcast(mdata, subjectID + activity.type ~ variable, mean)

# finally... 
# save the small tidy dataset for evaluation 
write.table(ddata, file="tidy_data.txt")







