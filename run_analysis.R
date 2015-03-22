## read test and train set
test <- read.table("./UCI_HAR_Dataset/test/X_test.txt")
train <- read.table("./UCI_HAR_Dataset/train/X_train.txt")

## get features label
features <- read.table("./UCI_HAR_Dataset/features.txt")
features <- as.character(features$V2)

## cleaning features label
features <- sub("\\(\\)-", "_", features)
features <- sub("\\-", "_", features)
features <- sub("\\,", "_", features)
features <- sub("\\(\\)", "", features)
features <- sub("\\(", "", features)
features <- sub("\\)", "", features)
features <- sub("\\)", "", features)

## add labels to test and train
colnames(test) <- features
colnames(train) <- features

## add type to test and train
test$subject <- "TEST"
train$subject <- "TRAIN"

## get test and train labels
test_labels <- read.table("./UCI_HAR_Dataset/test/y_test.txt")
train_labels <- read.table("./UCI_HAR_Dataset/train/y_train.txt")
test_labels <- test_labels$V1
train_labels <- train_labels$V1
test$activity <- factor(test_labels)
train$activity <- factor(train_labels)

## merge test and train
data <- rbind(test, train)

## subset means and stds
subset_cols <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254,
                  266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543, 562, 563)
data <- data[, subset_cols]

## label the activity name
levels(data$activity) <- c("walking", "walking_upstairs", "walking_downstairs",
                           "sitting", "standing", "laying")
## reshape data set with the average of each variable for each activity and each subject
data_reshape <- aggregate( . ~ activity + subject, data = data, mean)
write.table(data_reshape, "getting_and_cleaning_data_courese_project.txt", row.names = FALSE)










