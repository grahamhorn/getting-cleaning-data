
The run_analysis.R script performs all of the steps required for the Coursera Getting and Cleaning Data course project.

It assumes that the data at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip has been downloaded and unzipped into the current working directory.

The script does the work in the following stages:

1. Loads the test and training data into local variables (dataframes)
2. Merges the data into one dataframe for each of type of file (the data itself and the activity and subject labels)
3. Labels the columns with the names of the features (from the features.txt file)
4. Adds the activity and subject labels as further columns
5. Drops the data columns that are not associated with the mean or standard deviation for the measurements (Assumes that only the columns whose labels include "mean" or "std" should be kept)
6. Replaces the activity coding with a descriptive label, from the activity_labels.txt file - this first tidy data set is stored in a variable called df.
7. Creates a dataframe called means_df that contains the average of each variable for each activity and each subject. The hint to use summarize_each was used from the forum: https://class.coursera.org/getdata-033/forum/thread?thread_id=212



To run the script use source("run_analysis.R")

The output of the script is the means_df dataframe (stage 7 above, step 5 of the instructions).