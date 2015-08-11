library(dplyr)
## integrate the train set and test set into one dataset
##read subject into R
subject_train <-read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
subject_test <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
subject <-rbind(subject_train,subject_test)
## delete the uncessary variable in order to reduce the used momery
rm(list =c("subject_train","subject_test"))
## read x into R
x_train <- read.table(".\\UCI HAR Dataset\\train\\x_train.txt")
x_test  <- read.table(".\\UCI HAR Dataset\\test\\x_test.txt")
x <-rbind(x_train,x_test)
rm(list =c("x_train","x_test"))
## read y into R
y_train <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
y_test <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
y <-rbind(y_train,y_test)
rm(list =c("y_train","y_test"))
## read the feature names into R
feature_name <- read.table(".\\UCI HAR Dataset\\features.txt")
feature_name[,2] <- as.character(feature_name[,2]);
##extracts only the measurements 
##on the mean and standard deviation for each measurement.
ms_feautre_name <-feature_name[grep("mean|std|Mean|Std",feature_name[,2]),]
process_x <-x[,as.numeric(ms_feautre_name[,1])]
names(process_x) <- ms_feautre_name[,2]
##load the activity labels into R
activity_labels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")
## Uses descriptive activity names to name the activities in the data set
activity_names <- activity_labels[match(y[,1],activity_labels[,1]),2]
#combine activity labels, activity names, subject,
#the mean and standard deviation for each measurement together into dataset
dataset <-cbind(y,activity_names,subject,process_x)
#  labels the data set with descriptive variable names
names(dataset) <- c("activityLabel","activityName","Subject",names(process_x))
names(dataset) <- gsub("\\(|\\)|-|,","",names(dataset))
names(dataset) <- gsub("mean","Mean",names(dataset))
names(dataset) <- gsub("std","Std",names(dataset))
#create a second, independent tidy data set with 
#the average of each variable for each activity and each subject
df <-tbl_df(dataset)
groupby <-group_by(df,activityLabel,Subject)
new_dataset <- summarise_each(groupby, funs(mean))
write.table(dataset, file ="dataset.txt",row.name=FALSE)
write.table(new_dataset,file="new_dataset.txt",row.name=FALSE)
rm(list =ls())
