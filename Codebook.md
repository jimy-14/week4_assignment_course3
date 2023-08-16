---
title: "Codebook"
author: "Jim"
date: "2023-08-16"
output: html_document
---



## Codebook
This script downloads dplyr package 
downloads "human_activity_recognition" file in .zip file format
unzip the file using unzip() function which extracts "UCI HAR Dataset" folder

reading .txt files using read.table and assigning variable names 
features :features.txt 
features.txt file has 561 rows and 2 columns and is assigned name features. variable names for the measurements from 3-axial raw signals of accelerometer and gyroscope, t denotes "time doamin" signals
signals(Acc-XYZ and Gyro-XYZ).Acceleration signal is separated into body and gravity acceleration 
signals (BodyAcc-XYZ and GravityAcc-XYZ).Mag represents Magnitude. tBodyAccMag, tGravityAccMag, tBodyAccJerkMag,tBodyGyroMag, tBodyGyroJerkMag are dervied in t and f domains
using Euclidean norm. f denotes "frequency domain" signals and similarly fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag are calculate.
f features.txt file is measurements of raw signals of accelerometer and gyroscope along x,y,z axis tAcc-XYZ and tGyro-XYZ.
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
 

activities: activity_labels.txt 
activity_labels.txt has 6 rows and 2 columns and is assigned name activities one column has number(code) representing activities,
other column has names of activities that were done.

subject_test:subject_test.txt 
subject_test.txt has 2947 rows and 1 column and is assigned name subject_test.
it has codes of subjects in test data

x_test: X_test.txt 
X_test.txt has 2947 rows for test data and 561 columns and is assigned name x_test.561 columns 
represent values of variables defined in features.txt 

y_test:y_test.txt 
y_test.txt has 2947 rows and 1 column and is assigned name y_test. this is code labels of activities 
for test data.
  
subject_train:subject_train.txt 
subject_train.txt has 7352 rows and 1 column and is assigned name subject_train.
it has codes of subjects in train data.

x_train : X_train.txt
X_train.txt has 7352 rows for training data and 561 columns and is assigned name x_train.561 columns 
represent values of variables defined in features.txt

y_train:y_train.txt
y_train.txt has 7352 rows and 1 column and is assigned name y_train. this is code labels of activities 
for test data.

Naming the columns for ease of understanding data.
x_train and x_test are given the column names from column 2 of features data.
columns from both y_train and y_test are given name activity_code
columns from both y_subject and y_subject are given name subject_number

step 1:Merges the training and the test sets to create one data set

data_features is obtained from x_train and x_test using rbind() function. rows are appended 
since both x_train and x_test had same number of columns resulting dataset has 10299 rows
representing whole x or features values data.

data_activity is obtained from y_train and y_test using rbind() function. rows are appended 
since both y_train and y_test had same number of columns resulting dataset has 10299 rows
representing whole y or activity labels data.

Subject is obtained from subject_train and subject_test using rbind() function. rows are appended 
since both subject_train and subject_test had same number of columns resulting dataset has 10299 rows
representing whole Subject data.

merge_data is obtained from merging Subject,data_features and data_activity using cbind() function.
it has 10299 rows and 563 columns.

step 2:Extracts only the measurements on the mean and standard deviation for each measurement
select_Data has 10299 rows and 88 columns and obtained from merge_data by selecting subject_number,activity_code 
and columns having mean and std.including columns having mean at start of name as well.

Step 3: Uses descriptive activity names to name the activities in the data set
activity_code column conatining code number for activities is tranformed to names of 
activites taken from second column of activities.

Step 4:Appropriately labels the data set with descriptive variable names
on observing the variable names following corrections were made to make column 
names descriptive
"^t"replaced by "Time_domain_"
"^f" replaced by"Frequency_domain_"
"Acc"replaced by"_linear_Acceleration"
"Gyro"replaced by"_angular_velocity"
"mean()"replaced by "mean"
"std()"replaced by "Standard_deviation"
"Jerk"replaced by "_jerk"
"Mag"replaced by "_Magnitude"
"meanFreq()"replaced by "mean_Frquency"
"tBody"replaced by "Time_domain_Body"
"BodyBody"replaced by "Body"
"angle"replaced by "Angle"
"gravity"replaced by "Gravity"

step 5: independent_tidy_data  was created by calculating mean of all
grouped variables after grouping by subject_number and activity(activity_code) 

independent_tidy_data is written to "Tidy_data.txt" using write.table
Tidy_data has 88 variables as follows:
  "subject_number" "activity_code" "Time_domain_Body_linear_Acceleration-mean()-X"
"Time_domain_Body_linear_Acceleration-mean()-Y" "Time_domain_Body_linear_Acceleration-mean()-Z" 
"Time_domain_Gravity_linear_Acceleration-mean()-X" "Time_domain_Gravity_linear_Acceleration-mean()-Y"
"Time_domain_Gravity_linear_Acceleration-mean()-Z" "Time_domain_Body_linear_Acceleration_jerk-mean()-X"
"Time_domain_Body_linear_Acceleration_jerk-mean()-Y" "Time_domain_Body_linear_Acceleration_jerk-mean()-Z" 
"Time_domain_Body_angular_velocity-mean()-X" "Time_domain_Body_angular_velocity-mean()-Y"
"Time_domain_Body_angular_velocity-mean()-Z" "Time_domain_Body_angular_velocity_jerk-mean()-X"
"Time_domain_Body_angular_velocity_jerk-mean()-Y" "Time_domain_Body_angular_velocity_jerk-mean()-Z"
"Time_domain_Body_linear_Acceleration_Magnitude-mean()" "Time_domain_Gravity_linear_Acceleration_Magnitude-mean()" 
"Time_domain_Body_linear_Acceleration_jerk_Magnitude-mean()" "Time_domain_Body_angular_velocity_Magnitude-mean()" 
"Time_domain_Body_angular_velocity_jerk_Magnitude-mean()" "Frequency_domain_Body_linear_Acceleration-mean()-X" 
"Frequency_domain_Body_linear_Acceleration-mean()-Y" "Frequency_domain_Body_linear_Acceleration-mean()-Z"
"Frequency_domain_Body_linear_Acceleration-mean_Frquency()-X" "Frequency_domain_Body_linear_Acceleration-mean_Frquency()-Y"
"Frequency_domain_Body_linear_Acceleration-mean_Frquency()-Z" "Frequency_domain_Body_linear_Acceleration_jerk-mean()-X"
"Frequency_domain_Body_linear_Acceleration_jerk-mean()-Y" "Frequency_domain_Body_linear_Acceleration_jerk-mean()-Z" 
"Frequency_domain_Body_linear_Acceleration_jerk-mean_Frquency()-X" "Frequency_domain_Body_linear_Acceleration_jerk-mean_Frquency()-Y" 
"Frequency_domain_Body_linear_Acceleration_jerk-mean_Frquency()-Z" "Frequency_domain_Body_angular_velocity-mean()-X" 
"Frequency_domain_Body_angular_velocity-mean()-Y" "Frequency_domain_Body_angular_velocity-mean()-Z" 
"Frequency_domain_Body_angular_velocity-mean_Frquency()-X" "Frequency_domain_Body_angular_velocity-mean_Frquency()-Y"
"Frequency_domain_Body_angular_velocity-mean_Frquency()-Z" "Frequency_domain_Body_linear_Acceleration_Magnitude-mean()" 
"Frequency_domain_Body_linear_Acceleration_Magnitude-mean_Frquency()" "Frequency_domain_Body_linear_Acceleration_jerk_Magnitude-mean()"
"Frequency_domain_Body_linear_Acceleration_jerk_Magnitude-mean_Frquency()" "Frequency_domain_Body_angular_velocity_Magnitude-mean()" "Frequency_domain_Body_angular_velocity_Magnitude-mean_Frquency()" "Frequency_domain_Body_angular_velocity_jerk_Magnitude-mean()" "Frequency_domain_Body_angular_velocity_jerk_Magnitude-mean_Frquency()" "Angle(Time_domain_Body_linear_AccelerationMean,Gravity)" "Angle(Time_domain_Body_linear_Acceleration_jerkMean),GravityMean)" "Angle(Time_domain_Body_angular_velocityMean,GravityMean)" "Angle(Time_domain_Body_angular_velocity_jerkMean,GravityMean)" "Angle(X,GravityMean)" "Angle(Y,GravityMean)" "Angle(Z,GravityMean)" "Time_domain_Body_linear_Acceleration-Standard_deviation()-X" "Time_domain_Body_linear_Acceleration-Standard_deviation()-Y" "Time_domain_Body_linear_Acceleration-Standard_deviation()-Z" "Time_domain_Gravity_linear_Acceleration-Standard_deviation()-X" "Time_domain_Gravity_linear_Acceleration-Standard_deviation()-Y" "Time_domain_Gravity_linear_Acceleration-Standard_deviation()-Z" "Time_domain_Body_linear_Acceleration_jerk-Standard_deviation()-X" "Time_domain_Body_linear_Acceleration_jerk-Standard_deviation()-Y" "Time_domain_Body_linear_Acceleration_jerk-Standard_deviation()-Z" "Time_domain_Body_angular_velocity-Standard_deviation()-X" "Time_domain_Body_angular_velocity-Standard_deviation()-Y" "Time_domain_Body_angular_velocity-Standard_deviation()-Z" "Time_domain_Body_angular_velocity_jerk-Standard_deviation()-X" "Time_domain_Body_angular_velocity_jerk-Standard_deviation()-Y" "Time_domain_Body_angular_velocity_jerk-Standard_deviation()-Z" "Time_domain_Body_linear_Acceleration_Magnitude-Standard_deviation()" "Time_domain_Gravity_linear_Acceleration_Magnitude-Standard_deviation()" "Time_domain_Body_linear_Acceleration_jerk_Magnitude-Standard_deviation()" "Time_domain_Body_angular_velocity_Magnitude-Standard_deviation()" "Time_domain_Body_angular_velocity_jerk_Magnitude-Standard_deviation()" "Frequency_domain_Body_linear_Acceleration-Standard_deviation()-X" "Frequency_domain_Body_linear_Acceleration-Standard_deviation()-Y" "Frequency_domain_Body_linear_Acceleration-Standard_deviation()-Z" "Frequency_domain_Body_linear_Acceleration_jerk-Standard_deviation()-X" "Frequency_domain_Body_linear_Acceleration_jerk-Standard_deviation()-Y" "Frequency_domain_Body_linear_Acceleration_jerk-Standard_deviation()-Z" "Frequency_domain_Body_angular_velocity-Standard_deviation()-X" "Frequency_domain_Body_angular_velocity-Standard_deviation()-Y" "Frequency_domain_Body_angular_velocity-Standard_deviation()-Z" "Frequency_domain_Body_linear_Acceleration_Magnitude-Standard_deviation()" "Frequency_domain_Body_linear_Acceleration_jerk_Magnitude-Standard_deviation()" "Frequency_domain_Body_angular_velocity_Magnitude-Standard_deviation()" "Frequency_domain_Body_angular_velocity_jerk_Magnitude-Standard_deviation()"
  
