require(ISLR2)
require(MASS)

?lda

## Linear Discriminant Analysis
# take returns from previous 2 days to try to predict direction
lda.fit=lda(Direction~Lag1+Lag2, data=Smarket, subset = Year<2005)

# Train
lda.fit

# Plot LDA function for each group 
# It seems there is no much difference
plot(lda.fit)

Smarket.2005=subset(Smarket,Year==2005)

# Let's see how it predicts from 2005 
lda.pred = predict(lda.fit, Smarket.2005)

# Check preds 
lda.pred[1:5,]

class(lda.pred)

# Let's check the list using a dataframe
# when having a list of variables with same number of observations 
# use a dataframe
data.frame(lda.pred)[1:5,]

# Let do a table of the predictions
table(lda.pred$class, Smarket.2005$Direction)

# Get correct precitions
mean(lda.pred$class== Smarket.2005$Direction)

