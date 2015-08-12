The repo is used to store materials relavent to course project of Getting and Cleaning Data.
The repo includes the following files:
"dataset.txt"  combines the training set and the test set into one dataset by activity labels,activity names, subject identities and other 86  mean and standard deviation for each measurement.
"new_dataset.txt" generates an independent tidy dataset which  covers the average of each variable for each activity and each subject. All attributes are identical to the one above.
"CODEBOOK.md" describes every variable in the two tidy datasets mentioned above.
"run_analysis.R" provides the script to process the original data.I suppose that you have installed the dylpr package and have downloaded and unzipped the original data into the current working directory. Just run this script R will generate two datasets above. Step 1- Step 5 are outlined in the comments of the script.