Original data are found in "UCI HAR Dataset/test/x_test.txt" and "UCI HAR Dataset/train/x_train.txt"

These data are read into R using read.table, then merged together using rbind

The combined data.frame is converted into tbl format so that the data may be tidied with dplyr commands.

Only columns with mean and std info in retained. These columns are:
c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,
				227,228,240,241,253,254,266:271,345:350,424:429,
				503,504,516,517,529,530,542,543)

The names of the variables are read in from the features.txt file found in "UCI HAR Dataset/features.txt" These names are then assigned to the dataset’s variables.

The tidy dataset is written out to “means&stds.txt”

The mean of each variable is calculated and written out to “means.txt”