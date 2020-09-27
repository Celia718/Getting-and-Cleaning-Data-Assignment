library(stringr)
X_train <- read.table("~/Desktop/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
X_test <- read.table("~/Desktop/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
features <- read.table("~/Desktop/UCI HAR Dataset/features.txt", quote="\"", comment.char="")
names(X_test)=features$V2
names(X_train)=features$V2
X = rbind(X_test,X_train)
y_test <- read.table("~/Desktop/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
y_train <- read.table("~/Desktop/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")
Y = rbind(y_test, y_train)
names(Y) = 'activity'
data = X[,str_detect(names(X),c("mean|std"))]
dummy_y=factor(Y$activity)
levels(dummy_y)=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
Y$activity=dummy_y
data_2 = cbind(data,Y)
subject_train <- read.table("~/Desktop/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
subject_test <- read.table("~/Desktop/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")
subject = rbind(subject_train,subject_test)
names(subject) = "subject"
data_3 = cbind(data_2,subject)
extra_data = aggregate(.~activity+subject,data_3,mean)





