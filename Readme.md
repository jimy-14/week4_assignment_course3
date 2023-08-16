---
title: "Readme"
author: "Jim"
date: "2023-08-16"
output: html_document
---

## ReadMe

README
"UCI HAR Dataset" is set of files provided and needs to be converted to tidy form
This repository contains following files:

"Tidy_data.txt" final tidy data set file in long form ,generated after applying all transformations
and meeting requirements outlined by Hadley Wickham paper 

"run_analysis.R" is R script for performing data transformation to convert "UCI HAR Dataset" in tidy form.
this script performs following functions:
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

"Codebook.md" is a code book that describes the variables in data set, steps performed, and 

"Readme.R" file containing 4 file names including Readme.R file and instructions on how to read data 


code for reading "Tidy_data.txt" file:

```
data <- read.table(file_path, header = TRUE) 
View(data)
```
