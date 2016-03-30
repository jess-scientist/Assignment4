run_analysis <- function(){
	
	library(dplyr)
	
	# Read files into R
	file_xtest <- "UCI HAR Dataset/test/x_test.txt"
	file_xtrain <- "UCI HAR Dataset/train/x_train.txt"
	
	xtest <- read.table(file_xtest)
	xtrain <- read.table(file_xtrain)
	
	# Merge two datasets
	xboth_df <- rbind(xtest,xtrain)

	# Put into tbl format
	xboth <- tbl_df(xboth_df)
	
	# Select only the wanted columns
	mnstd <- c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,
				227,228,240,241,253,254,266:271,345:350,424:429,
				503,504,516,517,529,530,542,543)
				
	xboth <- select(xboth,mnstd)
	
	# Add names to the table
	file4 <- "UCI HAR Dataset/features.txt"
	mynames <- read.table(file4)
	allnames <- mynames$V2[mnstd]
	names(xboth) <- allnames
		
	# Find the means of each column
	second <- colMeans(xboth)
	
	# Write the tidy data to a file
	write.table(second,file="means.txt",sep='\t')
	write.table(xboth,file="means&stds.txt")
}