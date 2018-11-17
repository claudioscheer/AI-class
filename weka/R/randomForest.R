library(randomForest)

data <- read.csv("weka/R/csv-data.csv", header = TRUE)
set.seed(1)

train <- sample(nrow(data), 0.8 * nrow(data), replace = FALSE)
trainSet <- data[train, ]
validSet <- data[-train, ]
summary(trainSet)
summary(validSet)

model1 <- randomForest(Open ~ ., data = trainSet, importance = TRUE)
