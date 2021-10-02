## K-Nearest Neighbor 
library(class)

?knn

#attach(Smarket)

# combine Lag1 anc Lag2 by columns
Xlag = cbind(Lag1, Lag2)

# Get training data
train=Year<2005

# Create KNN
knn.pred=knn(Xlag[train,], Xlag[!train,],Direction[train], k=1)

# Let do a table of the predictions
table(knn.pred,Direction[!train])

# Get correct predictions
mean(knn.pred==Direction[!train])

