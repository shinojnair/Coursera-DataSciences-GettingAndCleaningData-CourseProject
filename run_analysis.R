
## Load the Library dplyr
library(dplyr)

## Load the data into a dplyr table from test folder for Test Subject, Test Set and Test Labels
subject_test <- tbl_dt(read.table("UCI HAR Dataset/test/subject_test.txt"))
X_test <- tbl_dt(read.table("UCI HAR Dataset/test/X_test.txt"))
y_test <- tbl_dt(read.table("UCI HAR Dataset/test/y_test.txt"))

## Load the data into a dplyr table from train folder for Train Subject, Train Set and Train Labels
subject_train <- tbl_dt(read.table("UCI HAR Dataset/train/subject_train.txt"))
X_train <- tbl_dt(read.table("UCI HAR Dataset/train/X_train.txt"))
y_train <- tbl_dt(read.table("UCI HAR Dataset/train/y_train.txt"))

## Load the data into a dplyr table for Activity Names
activity_labels <- tbl_dt(read.table("UCI HAR Dataset/activity_labels.txt"))

## Load the data into a dplyr table for Feature names that is information on the Train and Test variables
features <- tbl_dt(read.table("UCI HAR Dataset/features.txt"))

## Name columns in Activity table for readability
names(activity_labels) <- c("ActivityID", "ActivityDescription")

## Name columns in Feature table for readablity
names(features) <- c("FeatureID", "FeatureDescription")

## Name the variables in the Test and Train data with the variable description form feature table
names(X_test) <- as.character(features$FeatureDescription)
names(X_train) <- as.character(features$FeatureDescription)

## Name the Activity Table column for Test and Train to "Activity" for readability
names(y_test) <- "Activity"
names(y_train) <- "Activity"

## Name the Subject Table column for Test and Train to "Subject" for readability
names(subject_test) <- "Subject"
names(subject_train) <- "Subject"

## Combine Columns for all Tests with the test subject, activity and features
dtAllTestData <- bind_cols(subject_test, y_test, X_test)

## Combine Columns for all Train with the test subject, activity and features
dtAllTrainData <- bind_cols(subject_train, y_train, X_train)

## Prepare a combined data set for Test and Trains
dtAllData <- bind_rows(dtAllTrainData, dtAllTestData)

## Convert the Activity column inthe combined data table to factor to provide 
##      Activity Description instead of ID. Assign levels for the factor from
##      the Activity Label data Table
dtAllData$Activity <- as.factor(dtAllData$Activity)
levels(dtAllData$Activity) <- activity_labels$ActivityDescription

## Prep a tidy data set with columns that contain mean and st for the Activity and Subject
##      Gather the average for all variables for the each Activity and each Subject
##      Order the data by Activity and Subject and create a tidy_data data table.
tidy_data <- dtAllData %>%
        select(Subject, Activity, contains("mean"), contains("std")) %>%
        group_by(Activity, Subject) %>%
        summarize_each(funs(mean)) %>%
        arrange(Activity, Subject)

## Expor the tidy_data data table with clean data to a tab delimited file
write.table(tidy_data, file = "tidy_data.txt")
