library(gbm)          # basic implementation
library(xgboost)      # a faster implementation of gbm
library(class)
library(caret)        # an aggregator package for performing many machine learning models
library(ggplot2)      # model visualization
library(ggthemes)
library(GGally)
library(lime)         # model visualization
library(AppliedPredictiveModeling)


#Data understanding
str(abalone)
summary(abalone)
ggpairs(abalone)
#Looks like the input features are highly correlated.
data=abalone[,-2]
ggplot(data,aes(x=Diameter,y=Rings,fill=Type))+
  geom_bar(position="stack", stat="identity")+
  ggtitle("Distribution of Type based on Diameter and Rings.") +
  theme_void() 
#Split data for training
train_ix=createDataPartition(data$Rings,p=0.7,list = FALSE)
data_train=data[train_ix,]
data_test=data[-train_ix,]

gbm.model=gbm(Rings~.,data=data_train,n.trees=100,cv.folds = 5)
# get MSE and compute RMSE
sqrt(min(gbm.model$cv.error)) 
#change the number of trees to see the difference
gbm.model=gbm(Rings~.,data=data_train,n.trees=1000,cv.folds = 5)
# get MSE and compute RMSE
sqrt(min(gbm.model$cv.error)) 
lm.model=lm(Rings~.,data=data_train)
#get rmse
RSS <- c(crossprod(lm.model$residuals))
sqrt(RSS/length(lm.model$residuals))
gbm.perf(gbm.model)

# modify hyperparameter grid
hyper_grid <- expand.grid(
  shrinkage = c(.01, .05, .1),
  interaction.depth = c(3, 5, 7),
  n.minobsinnode = c(5, 7, 10),
  bag.fraction = c(.65, .8, 1), 
  optimal_trees = 0,               # a place to dump results
  min_RMSE = 0                     # a place to dump results
)


for(i in 1:nrow(hyper_grid)) {
  gbm.model_tune=gbm(Rings~.,
                     data=data_train,
                     n.trees=1000,
                     cv.folds = 5,
                     interaction.depth = hyper_grid$interaction.depth[i],
                     shrinkage = hyper_grid$shrinkage[i],
                     n.minobsinnode = hyper_grid$n.minobsinnode[i],
                     bag.fraction = hyper_grid$bag.fraction[i],
                     train.fraction = .75)
  hyper_grid$optimal_trees[i] <- which.min(gbm.model_tune$valid.error)
  hyper_grid$min_RMSE[i] <- sqrt(min(gbm.model_tune$valid.error))
}

hyper_grid[order(hyper_grid$min_RMSE),]


gbm.model.final=gbm(Rings~.,
                   data=data_train,
                   n.trees=190,
                   cv.folds = 5,
                   interaction.depth = 5,
                   shrinkage = 0.10,
                   n.minobsinnode = 5,
                   bag.fraction = 0.90,
                   train.fraction = .75)

sqrt(min(gbm.model.final$cv.error)) 
gbm.perf(gbm.model.final)
summary(gbm.model.final,cBars = 10,
        method = relative.influence, # also can use permutation.test.gbm
        las = 2)  
pred.rings.gbm=predict(gbm.model.final,data_test[,-8])
#table(data_test$Rings,pred.rings.gbm)
RSS <- c(crossprod(data_test$Rings-pred.rings.gbm))
gbm.rmse=sqrt(RSS/length(data_test$Rings))

pred.rings.lm=predict(lm.model,data_test[,-8])
RSS <- c(crossprod(data_test$Rings-pred.rings.lm))
lm.rmse=sqrt(RSS/length(data_test$Rings))

#Eventhough lm gave better results while traiing, GBM produced better and consisten result with train and test.
