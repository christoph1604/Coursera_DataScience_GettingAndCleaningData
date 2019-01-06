==================================================================
Coursera course: Getting and cleaning data - Course Project
Version 1.0
==================================================================
Christoph
==================================================================

This folder contains the conversion script and the data related to the course project of Coursera course "Getting and Cleaning data".
The project is based on the UCI HAR dataset. This dataset contains 3dimensional movement information recorded by a Smartphone. The data were collected during six different activities which were executed by 30 different volunteers.
Within the project, the dataset was converted to a new dataset "UCI_HAR_Dataset_converted" conforming to the following requirements:

1. The submitted data set is tidy.
2. The Github repo contains the required scripts.
3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4. The README that explains the analysis files is clear and understandable.
5. The work submitted for this project is the work of the student who submitted it.

The following requirements were given to the script executing the conversion:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This folder contains the following files:
==================================================================
- 'README.txt'
- 'CodeBook.html': A codebook explaining the resulting dataset and describing the conversion script
- 'CodeBook.md': The codebook in md format
- 'run_analysis.r': The conversion script performing read-in, conversion and writing of the UCI HAR Dataset to a new one, conforming to the above mentioned points
- Folder 'UCI HAR Dataset': The source dataset. See contained README for detailed description
- Folder 'UCI_HAR_Dataset_converted': The resulting dataset. Consists of the two files cleaned_features.csv and cleaned_features_averages.csv. See codebook for more detailed explanation. Amendmend: cleaned_features_averages.csv is also provided as txt file cleaned_features_averages_txt.txt, because we were asked to do so in the assignment description.

