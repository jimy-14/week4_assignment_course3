library(dplyr) #loading dplyr package
#checking if folder exist
filename <- "human_activity_recognition"
if (!file.exists('project')){
  dir.create("project")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, filename, method="libcurl") 
}
#unziping the file downloaded
unzip(filename)
#not usng inertial folder as stated by David Hood. 
#using read.table to read .txt files
features <- read.table("UCI HAR Dataset/features.txt")
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
#renaming columns of x_test,y_test,x_train,y_train,subject_test,subject_train 
#features are the column names in x_train, x_test datasets
#rename colomuns in test set 
names(x_test)<-features$V2
#rename colomuns in train set
names(x_train)<-features$V2
#rename colomun in activitys set in train
names(y_train)<-"activity_code"
#rename colomun in activitys set in test
names(y_test)<-"activity_code"
#rename colomun in subject set in train
names(subject_train)<-"subject_number"
#rename colomun in subject set in test
names(subject_test)<-"subject_number"

#Step1; Merging the training and the test sets to create one data set.

#on viewing data x_test and x_train have same(561) variables, appending both using rbind
data_features <- rbind(x_train, x_test)
#on viewing data y_test and y_train have same(1) variable, appending both using rbind
data_activity <- rbind(y_train, y_test)
#on viewing data , subject_train and subject_test have same(1) variable, appending both using rbind
Subject <- rbind(subject_train, subject_test)
#merging 
merge_data <- cbind(Subject, data_activity, data_features)

#Step2: Extracting only the measurements on the mean and standard deviation for each measurement.
#including all he signals having word "mean"
select_Data <- select(merge_data,subject_number,activity_code,contains("mean"), contains("std"))

#Step 3:Uses descriptive activity names to name the activities in the data set 
#assigning activities descriptive names as mentioned in activites
select_Data$activity_code <- activities[select_Data$activity_code,2]


#Step 4: Appropriately labels the data set with descriptive variable names
#select_Data
names(select_Data)<-gsub("^t","Time_domain_",names(select_Data))
names(select_Data)<-gsub("^f","Frequency_domain_",names(select_Data))
names(select_Data)<-gsub("Acc","_linear_Acceleration",names(select_Data))
names(select_Data)<-gsub("Gyro","_angular_velocity",names(select_Data))
names(select_Data)<-gsub("mean()", "mean", names(select_Data))
names(select_Data)<-gsub("std()", "Standard_deviation", names(select_Data))
names(select_Data)<-gsub("Jerk", "_jerk", names(select_Data))
names(select_Data)<-gsub("Mag", "_Magnitude", names(select_Data))
names(select_Data)<-gsub("meanFreq()", "mean_Frquency", names(select_Data))
names(select_Data)<-gsub("tBody", "Time_domain_Body", names(select_Data))
names(select_Data)<-gsub("BodyBody", "Body", names(select_Data))
names(select_Data)<-gsub("angle", "Angle", names(select_Data))
names(select_Data)<-gsub("gravity", "Gravity", names(select_Data))


#step 5:From the data set in step 4, creates a second, independent tidy data set with the
#average of each variable for each activity and each subject.
#grouping by subject_number and activity
independent_tidy_data<- group_by(select_Data,subject_number, activity_code) 
#calculating mean of all grouped variables after grouping by subject_number and activity
independent_tidy_data<- summarise_all(independent_tidy_data,mean)

#generating a .txt file "Tidy_data.txt" using write.table
write.table(independent_tidy_data, "Tidy_data.txt",row.names=FALSE))
#long form
