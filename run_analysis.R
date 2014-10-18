# Need plyr library to revalue factors
library(plyr)



mess.train <- readLines(con <- file("UCIHARDataset/train/X_train.txt"))
mess.train <- gsub("  ", " ", mess.train)
# Remove the leading white space so there isn't an empty column
mess.train <- substring(mess.train, first=2)

# This file can now be read in, but read.table only works for files, not data types.
# So, write it to a text file and read it back in
# First, add on the y column to the end
fileOut <- file("tempTrainFile.txt")
writeLines(mess.train, fileOut)
close(fileOut)

# To conserve memory, get ride of data1 before reading it back in
remove(mess.train)

clean.train <- read.csv("tempTrainFile.txt", sep=" ", header=FALSE)

# Add in the 'y' data, and rename the 'numeric' factors to descriptive 'character' factors
file.train.y <- read.csv("UCIHARDataset/train/y_train.txt", sep=" ", header=FALSE)
file.train.y <- revalue(as.factor(file.train.y[[1]]), replace = c("1"="WALKING", "2"="WALKING_UPSTAIRS", "3"="WALKING_DOWNSTAIRS", "4"="SITTING", "5"="STANDING", "6"="LAYING"))
clean.train <- cbind(clean.train, ActivityType = file.train.y)

# Also add the user ID as a new column
file.train.user <- read.csv("UCIHARDataset/train/subject_train.txt", sep=" ", header=FALSE)
clean.train <- cbind(clean.train, UserID = as.factor(file.train.user[[1]]))



# Do the same thing for the training set
mess.test <- readLines(con <- file("UCIHARDataset/test/X_test.txt"))
mess.test <- gsub("  ", " ", mess.test)
# Remove the leading white space so there isn't an empty column
mess.test <- substring(mess.test, first=2)

# This file can now be read in, but read.table only works for files, not data types.
# So, write it to a text file and read it back in
fileOut <- file("tempTestFile.txt")
writeLines(mess.test, fileOut)
close(fileOut)

# To conserve memory, get ride of data1 before reading it back in
remove(mess.test)

clean.test <- read.csv("tempTestFile.txt", sep=" ", header=FALSE)

file.test.y <- read.csv("UCIHARDataset/test/y_test.txt",    sep=" ", header=FALSE)
# Rename the 'numeric' factors to descriptive 'character' factors
file.test.y <- revalue(as.factor(file.test.y[[1]]), replace = c("1"="WALKING", "2"="WALKING_UPSTAIRS", "3"="WALKING_DOWNSTAIRS", "4"="SITTING", "5"="STANDING", "6"="LAYING"))
clean.test <- cbind(clean.test, ActivityType = file.test.y)

# Also add the user ID as a new column
file.test.user <- read.csv("UCIHARDataset/test/subject_test.txt", sep=" ", header=FALSE)
clean.test <- cbind(clean.test, UserID = as.factor(file.test.user[[1]]))




# Merge the two datasets together
clean.all <- rbind(clean.train, clean.test)

# Remove the separate datasets to conserve memory
rm(clean.test)
rm(clean.train)


# We need descriptive column names. There are a lot of columns, 
# so I am going to read in the column names already listed in a feature text,
# and extract those names and add those to the file
colNames <- readLines(con <- file("UCIHARDataset/features.txt"))
colNames.split <- strsplit(colNames, " ")
secondElement <- function(x) {x[2]}
colNames.split <- sapply(colNames.split, secondElement)

# Add in one more row entry to represent the 'y' data column.
colNames.split[562] <- c("ActivityType")
colNames.split[563] <- c("UserID")

# Make these names the header of the combined dataset
names(clean.all) <- colNames.split


# Extract only the columns which have means, or stds, as per the instructions. 
getCols <- grepl("mean\\(\\)|std\\(\\)|ActivityType|UserID", colNames.split)
# Also include the last column indicating the type of activity. I have a feeling it should still
getCols[562] <- TRUE
getCols[563] <- TRUE


clean.skim <- clean.all[,getCols]


# Okay, steps 1-4 are now complete. Now do step 5, where a tidy datset is made.

# First, melt the dataframe so that the ids are UserID and activity, and the measures are everything else.
library(reshape2)
skim.melt <- melt(clean.skim, id=c("UserID", "ActivityType"))
# Next, cast it based on UserID and ActivityType, with the mean of each remaining variable
skim.cast <- dcast(skim.melt, UserID + ActivityType ~ variable, mean)


# Write out the data set to a file as per instructions
write.table(skim.cast, "myTidyData.txt", row.names=FALSE)



