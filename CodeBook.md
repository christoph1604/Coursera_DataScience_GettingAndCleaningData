---
title: "CodeBook.md"
author: "Christoph"
date: "6 Januar 2019"
output: html_document
---

# Summary
This codebook describes the data transformation developed within the course project of Coursera course "Getting and Cleaning data". First, the output of the data transformation is explained. Later one, the transformation script "run_analysis.r" is described.

# Data description
The output of the data transformation consists of two data files:
1. cleaned_features.csv
2. cleaned_features_averages.csv

## cleaned_features.csv

This file contains the output of the data conversion. I.e. the result of the transformations described in the assignment points 1 to 4. 

1. The training and test data of the original data set "UCI_HAR_Dataset" are merged to one dataset
2. Only the measurements (features) on means and standard deviations are included in the new dataset
3. The activities names are given explicitely in one column of the file
4. Appropriate labels (i.e. column titles) are introduced to the dataset 

All in all, cleaned_features.csv consists of the following columns:

1. measurement_window_id: An ID uniquely identifying a measurement window of the original dataset
2. volunteer_nr: The ID of the volunteer to which the current data row belongs
3. activity: A string describing the activity which the volunteer was executing during recording the current dataset

The following columns contain the mean and standard deviation features of the original dataset. For more detailed description of the variables, please see the documentation of the original dataset.

4.	tBodyAcc-mean()-X
5.	tBodyAcc-mean()-Y
6.	tBodyAcc-mean()-Z
7.	tBodyAcc-std()-X
8.	tBodyAcc-std()-Y
9.	tBodyAcc-std()-Z
10.	tGravityAcc-mean()-X
11.	tGravityAcc-mean()-Y
12.	tGravityAcc-mean()-Z
13.	tGravityAcc-std()-X
14.	tGravityAcc-std()-Y
15.	tGravityAcc-std()-Z
16.	tBodyAccJerk-mean()-X
17.	tBodyAccJerk-mean()-Y
18.	tBodyAccJerk-mean()-Z
19.	tBodyAccJerk-std()-X
20.	tBodyAccJerk-std()-Y
21.	tBodyAccJerk-std()-Z
22.	tBodyGyro-mean()-X
23.	tBodyGyro-mean()-Y
24.	tBodyGyro-mean()-Z
25.	tBodyGyro-std()-X
26.	tBodyGyro-std()-Y
27.	tBodyGyro-std()-Z
28.	tBodyGyroJerk-mean()-X
29.	tBodyGyroJerk-mean()-Y
30.	tBodyGyroJerk-mean()-Z
31.	tBodyGyroJerk-std()-X
32.	tBodyGyroJerk-std()-Y
33.	tBodyGyroJerk-std()-Z
34.	tBodyAccMag-mean()
35.	tBodyAccMag-std()
36.	tGravityAccMag-mean()
37.	tGravityAccMag-std()
38.	tBodyAccJerkMag-mean()
39.	tBodyAccJerkMag-std()
40.	tBodyGyroMag-mean()
41.	tBodyGyroMag-std()
42.	tBodyGyroJerkMag-mean()
43.	tBodyGyroJerkMag-std()
44.	fBodyAcc-mean()-X
45.	fBodyAcc-mean()-Y
46.	fBodyAcc-mean()-Z
47.	fBodyAcc-std()-X
48.	fBodyAcc-std()-Y
49.	fBodyAcc-std()-Z
50.	fBodyAccJerk-mean()-X
51.	fBodyAccJerk-mean()-Y
52.	fBodyAccJerk-mean()-Z
53.	fBodyAccJerk-std()-X
54.	fBodyAccJerk-std()-Y
55.	fBodyAccJerk-std()-Z
56.	fBodyGyro-mean()-X
57.	fBodyGyro-mean()-Y
58.	fBodyGyro-mean()-Z
59.	fBodyGyro-std()-X
60.	fBodyGyro-std()-Y
61.	fBodyGyro-std()-Z
62.	fBodyAccMag-mean()
63.	fBodyAccMag-std()
64.	fBodyBodyAccJerkMag-mean()
65.	fBodyBodyAccJerkMag-std()
66.	fBodyBodyGyroMag-mean()
67.	fBodyBodyGyroMag-std()
68.	fBodyBodyGyroJerkMag-mean()
69.	fBodyBodyGyroJerkMag-std()

## cleaned_features_averages.csv

This file contains the resulting dataset of the calculation described in assignment point 5.
From the dataset resulting from points 1 to 4, a second tidy dataset should be created containing the averages of each variable by activity and subject number. 

The file consists of the following columns:

1. volunteer_nr: The ID of the volunteer to which the current data row belongs
2. activity: A string describing the activity which the volunteer was executing during recording the current dataset

The following columns contain the averages of the variables in cleaned_features.csv. The average is calculated as mean of the data resulting from a grouping by volunteer_id and activity. 

3.	tBodyAcc-mean()-X_avg
4.	tBodyAcc-mean()-Y_avg
5.	tBodyAcc-mean()-Z_avg
6.	tBodyAcc-std()-X_avg
7.	tBodyAcc-std()-Y_avg
8.	tBodyAcc-std()-Z_avg
9.	tGravityAcc-mean()-X_avg
10.	tGravityAcc-mean()-Y_avg
11.	tGravityAcc-mean()-Z_avg
12.	tGravityAcc-std()-X_avg
13.	tGravityAcc-std()-Y_avg
14.	tGravityAcc-std()-Z_avg
15.	tBodyAccJerk-mean()-X_avg
16.	tBodyAccJerk-mean()-Y_avg
17.	tBodyAccJerk-mean()-Z_avg
18.	tBodyAccJerk-std()-X_avg
19.	tBodyAccJerk-std()-Y_avg
20.	tBodyAccJerk-std()-Z_avg
21.	tBodyGyro-mean()-X_avg
22.	tBodyGyro-mean()-Y_avg
23.	tBodyGyro-mean()-Z_avg
24.	tBodyGyro-std()-X_avg
25.	tBodyGyro-std()-Y_avg
26.	tBodyGyro-std()-Z_avg
27.	tBodyGyroJerk-mean()-X_avg
28.	tBodyGyroJerk-mean()-Y_avg
29.	tBodyGyroJerk-mean()-Z_avg
30.	tBodyGyroJerk-std()-X_avg
31.	tBodyGyroJerk-std()-Y_avg
32.	tBodyGyroJerk-std()-Z_avg
33.	tBodyAccMag-mean()_avg
34.	tBodyAccMag-std()_avg
35.	tGravityAccMag-mean()_avg
36.	tGravityAccMag-std()_avg
37.	tBodyAccJerkMag-mean()_avg
38.	tBodyAccJerkMag-std()_avg
39.	tBodyGyroMag-mean()_avg
40.	tBodyGyroMag-std()_avg
41.	tBodyGyroJerkMag-mean()_avg
42.	tBodyGyroJerkMag-std()_avg
43.	fBodyAcc-mean()-X_avg
44.	fBodyAcc-mean()-Y_avg
45.	fBodyAcc-mean()-Z_avg
46.	fBodyAcc-std()-X_avg
47.	fBodyAcc-std()-Y_avg
48.	fBodyAcc-std()-Z_avg
49.	fBodyAccJerk-mean()-X_avg
50.	fBodyAccJerk-mean()-Y_avg
51.	fBodyAccJerk-mean()-Z_avg
52.	fBodyAccJerk-std()-X_avg
53.	fBodyAccJerk-std()-Y_avg
54.	fBodyAccJerk-std()-Z_avg
55.	fBodyGyro-mean()-X_avg
56.	fBodyGyro-mean()-Y_avg
57.	fBodyGyro-mean()-Z_avg
58.	fBodyGyro-std()-X_avg
59.	fBodyGyro-std()-Y_avg
60.	fBodyGyro-std()-Z_avg
61.	fBodyAccMag-mean()_avg
62.	fBodyAccMag-std()_avg
63.	fBodyBodyAccJerkMag-mean()_avg
64.	fBodyBodyAccJerkMag-std()_avg
65.	fBodyBodyGyroMag-mean()_avg
66.	fBodyBodyGyroMag-std()_avg
67.	fBodyBodyGyroJerkMag-mean()_avg
68.	fBodyBodyGyroJerkMag-std()_avg

# Coding description

The data conversion from the old dataset ("UCI_HAR_Dataset") to the new one ("UCI_HAR_Dataset_converted") is done by the R script run_analysis.r. 

To convert the data to cleaned_features.csv, the script executes the following steps:

1. Set working directory to folder where the run_analysis.r lies
2. Load libraries
3. Reading in 'old' data files
4. Reading in feature naming file
5. Reading activity labels
6. Select relevant variables and set column names (in training and test dataset) as in documentation
7. Set column name for volunteer number 
8. Add volunteer number 
9. Set column names for activity number 
10. Add activity number
11. Merge training and test data
12. Replaces activity number by activity label
13. Add ID column and re-order the columns
14. Write result to cleaned_features.csv

Later on, the following steps are executed to average the variables and build cleaned_features_averages.csv:

15. Calculate average values of each variable for each activity and each subject (volunteer)
16. Append "_avg" to all columns with averaged value
17. write averages to addtional csv file (cleaned_features_averages.csv)

