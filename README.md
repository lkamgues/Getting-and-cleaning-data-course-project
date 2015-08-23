---
title: "README"
output: html_document
---
The goal of this project is to collect a dataset from the web, work with and clean to produce a compact, tidy dataset that can be used for later analysis. 
The data was collected from [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

The files includes in this repository are:

- run_analysis.R - the main script to produce the tidy data set
- codebook.md - descibes the dataset, the variables in the tidy data set and transformations used to obtain them
- README.md 

Five different steps were followed to generate the tidy data set.

- Set my working directory to the directory where the data exist, read in the necessary text files and combine the train and test data into one data frame.
- Read in "features.txt"" to get the index of columns containing mean and standard deviation measurements and extract them from the data frame. The columns extracted do not include "meanFreq()" features or features such as "tBodyAccJerkMean"
- Convert the *activity.type* variable from integer (1-6) to factor and label the activities as provided in "Y-train.txt"" For example "1"" is changed to "WALKING"
- Labelled the remaining variables (features) and substituted hyphens "-" by dots ".", "f" by freq and "t" by time  
- Compute the average for each extracte features for each subject and activity giving the final tidy dataset, written as "tidy_data.txt". 

