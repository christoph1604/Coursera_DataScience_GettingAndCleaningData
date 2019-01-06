#Set working directory to folder where the run_analysis.r lies
curr_dir <- dirname(parent.frame(2)$ofile)
setwd(curr_dir)
#setwd("D:/3_Project")

#Load libraries
library(dplyr)

#Reading 'old' data files
c_widths<-rep(16,561)
variables_training<-read.fwf("UCI HAR Dataset/train/X_train.txt", widths=c_widths, header=FALSE)
variables_test<-read.fwf("UCI HAR Dataset/test/X_test.txt", widths=c_widths, header=FALSE)

subj_training<-read.table("UCI HAR Dataset/train/subject_train.txt", sep=" ")
subj_test<-read.table("UCI HAR Dataset/test/subject_test.txt", sep=" ")

activities_training<-read.table("UCI HAR Dataset/train/y_train.txt", sep=" ")
activities_test<-read.table("UCI HAR Dataset/test/y_test.txt", sep=" ")

#Reading feature naming file
features_naming<-read.table("UCI HAR Dataset/features.txt", sep=" ")
selected_features<-grep("mean\\(\\)|std\\(\\)", features_naming$V2)
sel_feature_names<-features_naming$V2[selected_features]

#Reading activity labels
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt", sep=" ")
colnames(activity_labels)<-c("activity_nr", "activity")

#Select relevant variable and set column names as in documentation (in training and test dataset)
relev_var_training<-variables_training[,selected_features]
colnames(relev_var_training)<-sel_feature_names

relev_var_test<-variables_test[,selected_features]
colnames(relev_var_test)<-sel_feature_names

#Set column name for volunteer number 
colnames(subj_training)<-"volunteer_number"
colnames(subj_test)<-"volunteer_number"

#Add volunteer number 
relev_var_training<-cbind(subj_training, relev_var_training)
relev_var_test<-cbind(subj_test, relev_var_test)

#Set column names for activity number 
colnames(activities_training)<-"activity_nr"
colnames(activities_test)<-"activity_nr"

#Add activity number
relev_var_training<-cbind(activities_training, relev_var_training)
relev_var_test<-cbind(activities_test, relev_var_test)

#Merge training and test data
relev_var<-rbind(relev_var_training, relev_var_test)

#Replaces activity number by activity label
relev_var<-merge(relev_var, activity_labels, by.x="activity_nr", by.y="activity_nr") %>% select(everything(), -c("activity_nr"))

#Add ID column and re-order the columns
relev_var<-relev_var %>% mutate(measurement_window_id=row_number()) %>% select(measurement_window_id, volunteer_number, activity, everything())

#Write result to cleaned_features.csv
write.csv(relev_var, "./UCI_HAR_Dataset_converted/cleaned_features.csv", row.names=FALSE)

# Calculate average values of each variable for each activity and each subject (volunteer)
avg_var<-tbl_df(relev_var) %>% select(everything(), -c("measurement_window_id")) %>% group_by(volunteer_number, activity)
sum_avg_vars<-summarize_at(avg_var, as.character(sel_feature_names), funs(mean))

#Append "_avg" to all columns with averaged value
avg_col_names<-colnames(sum_avg_vars)
avg_value_cols<-seq(3,68)
avg_col_names[avg_value_cols]<-paste(avg_col_names[avg_value_cols], "_avg")
colnames(sum_avg_vars)<-avg_col_names

# write averages to addtional csv file (cleaned_features_averages.csv)
write.csv(sum_avg_vars, "./UCI_HAR_Dataset_converted/cleaned_features_averages.csv", row.names=FALSE)


