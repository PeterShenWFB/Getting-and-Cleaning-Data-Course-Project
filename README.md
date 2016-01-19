## Getting and Cleaning Data Course Project

Peter Shen

This repository contains an R script and related documents for the Getting and Cleaning Data course project.

# Overview

The assignment project is for student to demonstrate the ability to collect, work with, and clean a data set.

The target data set description can be found in [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The source data can be found at [Human Activity Recognition Using Smartphones Dataset v1.0](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

# Files in the repository

CodeBook.md describes the variables and data in the tidy output file of this project.

run_analysis.R is the R script built for this project, which performs the following steps:

1. Set to the target working directory.
2. Read all related files into data frames for the project.
3. Combine training and test data frames.
4. Extract measurements of means and standard deviations.
5. Replace the feature values with feature names.
6. Assign column names.
7. Merge features, activity, and subject to one data frame.
8. Calculate averages for each feature column.
9. Create a tidy data file.

tidy_averages.txt, the output file of the tidy data set.
