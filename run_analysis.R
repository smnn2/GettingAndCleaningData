## first reading the data from test and train folders

## reading from test
subjectTest <- read.table("test/subject_test.txt",sep ="\n")
Xtest <- read.table("test/X_test.txt",sep = "")
Ytest <- read.table("test/Y_test.txt",sep = "")

bodyAccXTest <- read.table("test/Inertial Signals/body_acc_x_test.txt",sep = "")
bodyAccYTest <- read.table("test/Inertial Signals/body_acc_y_test.txt",sep = "")
bodyAccZTest <- read.table("test/Inertial Signals/body_acc_z_test.txt",sep = "")

bodyGyroXTest <- read.table("test/Inertial Signals/body_gyro_x_test.txt",sep = "")
bodyGyroYTest <- read.table("test/Inertial Signals/body_gyro_y_test.txt",sep = "")
bodyGyroZTest <- read.table("test/Inertial Signals/body_gyro_z_test.txt",sep = "")

totalAccXTest <- read.table("test/Inertial Signals/total_acc_x_test.txt",sep = "")
totalAccYTest <- read.table("test/Inertial Signals/total_acc_y_test.txt",sep = "")
totalAccZTest <- read.table("test/Inertial Signals/total_acc_z_test.txt",sep = "")



## reading from train

subjectTrain <- read.table("train/subject_train.txt",sep ="\n")
Xtrain <- read.table("train/X_train.txt",sep = "")
Ytrain <- read.table("train/Y_train.txt",sep = "")

bodyAccXTrain <- read.table("train/Inertial Signals/body_acc_x_train.txt",sep = "")
bodyAccYTrain <- read.table("train/Inertial Signals/body_acc_y_train.txt",sep = "")
bodyAccZTrain <- read.table("train/Inertial Signals/body_acc_z_train.txt",sep = "")

bodyGyroXTrain <- read.table("train/Inertial Signals/body_gyro_x_train.txt",sep = "")
bodyGyroYTrain <- read.table("train/Inertial Signals/body_gyro_y_train.txt",sep = "")
bodyGyroZTrain <- read.table("train/Inertial Signals/body_gyro_z_train.txt",sep = "")

totalAccXTrain <- read.table("train/Inertial Signals/total_acc_x_train.txt",sep = "")
totalAccYTrain <- read.table("train/Inertial Signals/total_acc_y_train.txt",sep = "")
totalAccZTrain <- read.table("train/Inertial Signals/total_acc_z_train.txt",sep = "")


## now shaping data frame from the read data
testData <- data.frame(subjectID = subjectTest,lable = Ytest,
                       dataset = Xtest, bodyAcceleration_X = bodyAccXTest,
                       bodyAcceleration_Y = bodyAccYTest,
                       bodyAcceleration_Z = bodyAccZTest,
                       angularVelocity_X = bodyGyroXTest,
                       angularVelocity_Y = bodyGyroYTest,
                       angularVelocity_Z = bodyGyroZTest,
                       totalAcceleration_X = totalAccXTest,
                       totalAcceleration_Y = totalAccYTest,
                       totalAcceleration_Z = totalAccZTest)

trainData <- data.frame(subjectID = subjectTrain,lable = Ytrain,
                       dataset = Xtrain, bodyAcceleration_X = bodyAccXTrain,
                       bodyAcceleration_Y = bodyAccYTrain,
                       bodyAcceleration_Z = bodyAccZTrain,
                       angularVelocity_X = bodyGyroXTrain,
                       angularVelocity_Y = bodyGyroYTrain,
                       angularVelocity_Z = bodyGyroZTrain,
                       totalAcceleration_X = totalAccXTrain,
                       totalAcceleration_Y = totalAccYTrain,
                       totalAcceleration_Z = totalAccZTrain)

## merge two data frames together

mergedData = merge(testData,trainData,all=TRUE)

## calculating mean and standard deviation for each measurement

## dataset sd and mean

dataset_Temp <- select(mergedData,dataset.V1:dataset.V561)
dataset_SD <-apply(dataset_Temp,1,sd,na.rm = TRUE)
dataset_Mean <-apply(dataset_Temp,1,mean,na.rm = TRUE)

## body Acceleration sd and mean


bodyAcceleration_X_Temp <- select(mergedData,bodyAcceleration_X.V1:bodyAcceleration_X.V128)
bodyAcceleration_X_SD <- apply(bodyAcceleration_X_Temp,1,sd,na.rm=TRUE)
bodyAcceleration_X_Mean <- apply(bodyAcceleration_X_Temp,1,mean,na.rm=TRUE)


bodyAcceleration_Y_Temp <- select(mergedData,bodyAcceleration_Y.V1:bodyAcceleration_Y.V128)
bodyAcceleration_Y_SD <- apply(bodyAcceleration_Y_Temp,1,sd,na.rm=TRUE)
bodyAcceleration_Y_Mean <- apply(bodyAcceleration_Y_Temp,1,mean,na.rm=TRUE)


bodyAcceleration_Z_Temp <- select(mergedData,bodyAcceleration_Z.V1:bodyAcceleration_Z.V128)
bodyAcceleration_Z_SD <- apply(bodyAcceleration_Z_Temp,1,sd,na.rm=TRUE)
bodyAcceleration_Z_Mean <- apply(bodyAcceleration_Z_Temp,1,mean,na.rm=TRUE)


## Angular Velocity sd and mean

angularVelocity_X_Temp <- select(mergedData,angularVelocity_X.V1:angularVelocity_X.V128)
angularVelocity_X_SD <- apply(angularVelocity_X_Temp,1,sd,na.rm=TRUE)
angularVelocity_X_Mean <- apply(angularVelocity_X_Temp,1,mean,na.rm=TRUE)


angularVelocity_Y_Temp <- select(mergedData,angularVelocity_Y.V1:angularVelocity_Y.V128)
angularVelocity_Y_SD <- apply(angularVelocity_Y_Temp,1,sd,na.rm=TRUE)
angularVelocity_Y_Mean <- apply(angularVelocity_Y_Temp,1,mean,na.rm=TRUE)


angularVelocity_Z_Temp <- select(mergedData,angularVelocity_Z.V1:angularVelocity_Z.V128)
angularVelocity_Z_SD <- apply(angularVelocity_Z_Temp,1,sd,na.rm=TRUE)
angularVelocity_Z_Mean <- apply(angularVelocity_Z_Temp,1,mean,na.rm=TRUE)


## Total Acceleration sd and mean

totalAcceleration_X_Temp <- select(mergedData,totalAcceleration_X.V1:totalAcceleration_X.V128)
totalAcceleration_X_SD <- apply(totalAcceleration_X_Temp,1,sd,na.rm=TRUE)
totalAcceleration_X_Mean <- apply(totalAcceleration_X_Temp,1,mean,na.rm=TRUE)


totalAcceleration_Y_Temp <- select(mergedData,totalAcceleration_Y.V1:totalAcceleration_Y.V128)
totalAcceleration_Y_SD <- apply(totalAcceleration_Y_Temp,1,sd,na.rm=TRUE)
totalAcceleration_Y_Mean <- apply(totalAcceleration_Y_Temp,1,mean,na.rm=TRUE)


totalAcceleration_Z_Temp <- select(mergedData,totalAcceleration_Z.V1:totalAcceleration_Z.V128)
totalAcceleration_Z_SD <- apply(totalAcceleration_Z_Temp,1,sd,na.rm=TRUE)
totalAcceleration_Z_Mean <- apply(totalAcceleration_Z_Temp,1,mean,na.rm=TRUE)

## producing the tidy data

tidyData <- data.frame(subject_ID = mergedData$V1,
                        label = mergedData$V1.1,
                        dataset_mean = dataset_Mean,
                        bodyAcceleration_X_mean = bodyAcceleration_X_Mean,
                        bodyAcceleration_Y_mean = bodyAcceleration_Y_Mean,
                        bodyAcceleration_Z_mean = bodyAcceleration_Z_Mean,
                        angularVelocity_X_mean = angularVelocity_X_Mean,
                        angularVelocity_Y_mean = angularVelocity_Y_Mean,
                        angularVelocity_Z_mean = angularVelocity_Z_Mean,
                        totalAcceleration_X_mean = totalAcceleration_X_Mean,
                        totalAcceleration_Y_mean = totalAcceleration_Y_Mean,
                        totalAcceleration_Z_mean = totalAcceleration_Z_Mean)
write.table(tidyData,file = "tidyData.txt",row.name =FALSE)
