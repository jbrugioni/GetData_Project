#
#   
#   Course Project forGetting and Cleaning Data
#   https://class.coursera.org/getdata-009
#
#   John P. Brugioni
#   11/23/2014
#

library(dplyr);
library(plyr);

#download the data file
dataFilename<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip";
targetFilename<-"UCI_HAR_Dataset.zip";
download.file(dataFilename,targetFilename, "curl");
# unzip the data file
# put all the files in one (Linux easy) directory
dataDir<-"UCI_HAR_Dataset";
unzip(targetFilename,exdir=dataDir,junkpaths=TRUE); 


# load the data files
subj_test_filename<-paste(dataDir,"/","subject_test.txt",sep='');
subj_train_filename<-paste(dataDir,"/","subject_train.txt",sep='');
x_test_filename<-paste(dataDir,"/","X_test.txt",sep='');
y_test_filename<-paste(dataDir,"/","y_test.txt",sep='');
x_train_filename<-paste(dataDir,"/","X_train.txt",sep='');
y_train_filename<-paste(dataDir,"/","y_train.txt",sep='');
features_filename<-paste(dataDir,"/","features.txt",sep='');
activity_labels_filename<-paste(dataDir,"/","activity_labels.txt",sep=''); 
subj_test<-read.table(subj_test_filename);
subj_train<-read.table(subj_train_filename);

x_test<-read.table(x_test_filename);
y_test<-read.table(y_test_filename);
x_train<-read.table(x_train_filename);
y_train<-read.table(y_train_filename);
features<-read.table(features_filename);
activity_labels<-read.table(activity_labels_filename);


# Merge the training and the test sets to create one data set.
x_all<-rbind(x_test,x_train);
y_all<-rbind(y_test,y_train);
subj_all<-rbind(subj_test,subj_train);


# save off the compelted merged datasets
x_all_filename<-"x_all.txt";
y_all_filename<-"y_all.txt";
subj_all_filename<-"subj_all.txt";
write.table(x_all,x_all_filename, col.names=FALSE, row.names=FALSE);
write.table(y_all,y_all_filename, col.names=FALSE, row.names=FALSE);
write.table(subj_all,subj_all_filename, col.names=FALSE, row.names=FALSE);



# find the means, ignoring frequencies and angles
index<-grep("mean",features$V2, ignore.case=TRUE)
index2<-grep("freq",features$V2[index], ignore.case=TRUE, invert = TRUE)
index3<-grep("angle",features$V2[index[index2]], ignore.case=TRUE, invert = TRUE)
meanNames<-features[index[index2[index3]],]
meanIndices<-index[index2[index3]]
stdIndices<-grep("std",features$V2, ignore.case=TRUE)
stdNames<-features[stdIndices,]

# pull off the columns that correspond to the above indices
# create a new dataframe to take everything
# create it using the subject ID
newSet<-data.frame(subj_all);
newSet<-cbind(newSet,activity_labels$V2[y_all$V1]);
newSet<-cbind(newSet,x_all[,meanIndices])
newSet<-cbind(newSet,x_all[,stdIndices])
# set the column names
colnames(newSet)<-c("subj","activity",as.character(meanNames$V2),as.character(stdNames$V2))

# save the data
measurements_filename<-"measurements.txt";
write.table(newSet,measurements_filename)


# get the averages
means<-ddply(newSet,.(subj, activity),colwise(mean))
# new dataset
tidySet<-data.frame(means) 
# change names
colnames(tidySet)<-c(colnames(means)[1:2],paste("MEAN", colnames(means)[3:ncol(means)],sep="_"));


# save the tidy set
tidy_filename<-"tidy_data.txt";
write.table(tidySet,tidy_filename,row.name=FALSE)


