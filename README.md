# Course Project of Getting and Cleaning Data

## for running the script, the two folders that contain the data (test and train) must be copied to working directory of R
###the names are changed in this order (in tidyData file):
- X ---> dataset_mean
- Y ---> label
- subject_ ---> subject_ID
- body_acc_XYZ ---> bodyAcceleration_XYZ_mean
- total_acc_XYZ ---> totalAcceleration_XYZ_mean
- body_gyro_XYZ ----> angularVelocity_XYZ_mean
 
### How code works:
there are several comments in the code, but more detailes are presented here:
it first reads all the data from two folders "test and train" and for each set of data makes a data.frame (testData & trainData). Then it merges them based on subject id to shape the mergedData. the resulting data frame has 10299 rows that is the sum of rows in train and test data sets and it shows that the merging process has done correctly.
it then subset the merged data to extract the data for each measurement (all the objects with _Temp in the end are these subseted data) and then calcualtes the standard deviation and mean of each of them.
finally it creates the tidy data from some parts of mergedData plus the calcualted mean for each measurement. actually the calculated means replace the row measurements in mergedData.
