
# Read the data from the test and train directories
test_df <- read.table("UCI HAR Dataset/test/X_test.txt")
test_activities <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

train_df <- read.table("UCI HAR Dataset/train/X_train.txt")
train_activities <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

# (Step 1) merge the two into one dataframe for each type of file

df <- rbind(test_df, train_df)
activities <- rbind(test_activities, train_activities)
subjects <- rbind(test_subjects, train_subjects)

features <- read.table("UCI HAR Dataset/features.txt")

# (Step 4) Label the columns with the names of the features
colnames(df) <- features$V2

# (Step 4) Add the activity and subject columns, using those names
df$activity <- activities[,1]
df$subject <- subjects[,1]

# (Step 2) Only keep the mean and standard deviation for each measurement
# Also keep the activity and subject variables
mean_cols <- grep("mean", colnames(df))
std_cols <- grep("std", colnames(df))
selected_cols <- sort(append(append(mean_cols, std_cols), c(562, 563)))
df <- df[, selected_cols]

# (Step 3) Replace the activity coding with a descriptive label
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("id", "label")

df$activity <- factor(df$activity, labels = activity_labels$label)

# (Step 5) Create a summary
library(dplyr)

means_df <- summarize_each(group_by(df, subject, activity), funs(mean))
