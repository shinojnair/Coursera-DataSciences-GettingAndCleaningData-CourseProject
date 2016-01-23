
### Codebook for Course project on Getting And Cleaning Data in Coursera Course

 The purpose of this document is to describe the Data Files and the steps included to derive the tidy data set

##### Data Description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist. 
 
The obtained dataset has been randomly partitioned into two sets:
    * 70% of the volunteers was selected for generating the training data.
    * 30% of the volunteers was selected for generating the test data. 

##### Files
These are the files used from the data set with their short desctiption :

    * features.txt: List of all features - Includes is the name for all varibles for each observation.
    * activity_labels.txt: Links the class labels with their activity name (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
    * train/X_train.txt: Training set with all train observations.
    * train/y_train.txt: Training labels with the id for the Activity.
    * train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. 
    * test/X_test.txt: Test set with all test observations.
    * test/y_test.txt: Test labels with the id for the Activity.
    * train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample.

Each Observation Information in Train (X_train.txt) and Test (X_test.txt) include :

    * Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
    * Triaxial Angular velocity from the gyroscope. 
    * A 561-feature (observation) vector with time and frequency domain variables. 
    * Its activity label. 
    * An identifier of the subject who carried out the experiment.

##### Implementation Steps
    1. Download the data to a working directory.
    2. Load the required data into dplyr data tables.
    3. Rename appropriate columns with meaning full names that desctibe the data.
    4. Assign the variable names to train and test set from the activity lables data set.
    5. Combine the train and test data sets.
    6. Add the Activity column as a description rathen than an ID.
    7. Filter the combined data table with only the mean and sd columns.
    8. Calculate the average based for each Activity and Subject.
    9. Store the summarized data into a tidy_data dataset.
    10. Export the data into a file "tidy_data.txt"





