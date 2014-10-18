This repository contains an R script to read in a dataset from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

If this file is unzipped in the same folder which contains the R script run_analysis.R, the code will run as is.

There are various text files which need to be read in to create a single tidy data frame. 
The data is divided into 'train' and 'test' datasets. The steps are done separately but are identical for each dataset.
The first step is to read in the dataset as a text file, line by line. This is so the text can be cleaned by removing excess white space and creating a uniform separation of one white space between  entries. The data is then written out as a text file and read back in as a data.frame, containing 561 columns.

Two other datasets for each 'train' and 'test' series are also adding, one column each for the userID and the activity type. These columns are added to the dataset. There are now two datasets, divided into 'train' and 'type', with identical 563 columns.

These two datasets are combined into one single dataframe. The individual dataframes are no longer needed and are removed from memory to improve computer performance.

We next add column names to the data frame. Names are already available in a separate text file for the original 561 columns, so we read those names in, add our own names for the extra two columns ("UserID" and "ActivityType"), and assign those names to the columns.

We then take a subset of this data frame which has only the values which contain data on the mean and standard deviation of certain properties. We use a grep command to extract these columns since we have already added the column names, which are descriptive and allow us to use grep.

We now have a readable dataset with complete column names. We then make a table with the average of each column variable for each ActivityType and each UserID, using a combination of the melt and cast functions.

This small, tidy data frame is then written to a txt file, as per instructions.



