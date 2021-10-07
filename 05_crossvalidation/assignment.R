# Assignment 5.R

load("5.R.RData")
require(boot)

# 5.R.R1 
# Download the file 5.R.RData and load it into R using load("5.R.RData"). 
# Consider the linear regression model of y on X1 and X2. 
# What is the standard error for B1 

out.fit=lm(y ~ X1 + X2 , data=Xy)

summary(out.fit)

# 5.R.R2
# Next, plot the data using matplot(Xy,type="l"). 
# Which of the following do you think is most likely given what you see?

matplot(Xy,type="l")

lines(Xy$X1, col='blue')
lines(Xy$X2, col='purple')

# 5.R.R3
# Now, use the (standard) bootstrap to estimate . To within 10%, what do you get?

# In order to use bootstrap 
# we need to make a wrapper 
alpha.fn=function(data, index){
  coefficients(lm(y ~ X1 + X2 , data=Xy, subset = index))
}

alpha.fn(Xy,1:100)

set.seed(1)

boot.out=boot(Xy, alpha.fn, R=1000)
boot.out

boot.ci(boot.out, conf = 0.9)

boot.out

# 5.R.R4
# Finally, use the block bootstrap to estimate . 
# Use blocks of 100 contiguous observations, and resample ten whole blocks 
# with replacement then paste them together to construct each bootstrap time series.
# For example, one of your bootstrap resamples could be:
  

boot.fn=function(data){
  coefficients(lm(y ~ X1 + X2 , data=data))
}

# l=100 represents the blocks
block.out=tsboot(Xy , boot.fn,  R=1000, sim = 'fixed', l=100) 

block.out
