#Decision Tree
library(rpart)
library(rpart.plot)
library(vip)
library(caret)
ds=na.omit(bcancer[,-1])
head(ds)
train_ix=createDataPartition(ds$class, p = .8,list = FALSE)
train_ds=ds[train_ix,]
test_ds=ds[-train_ix,]
dim(train_ds);dim(test_ds)
bcancer_dt=rpart(class~.,
                 train_ds)
summary(bcancer_dt)
rpart.plot(bcancer_dt)
plotcp(bcancer_dt)
vip(bcancer_dt,bar = FALSE)
dt.class=predict(bcancer_dt,test_ds[,-10],type="class")
dt.class
table(dt.class,test_ds$class)
# library(ROCR)
# p=prediction(dt.class,test_ds$class)
# roc <- performance(p,"tpr","fpr")
# plot(roc,colorize=TRUE)