require(ISLR2)
require(boot)

# Cross val for Generalized Linear Models help
?cv.glm

# Plot mpg vs horsepower
plot(mpg~horsepower, data=Auto)

## LOOCV
# Puts the model repeteadly n times
#  Each times leaves 1 observation and produce fit on the rest
# Predicts on the leave out
glm.fit=glm(mpg~horsepower, data=Auto)

# Produce 2 numbers. 
# 1. Cross val result 
# 2. Bias correction of it
cv.glm(Auto, glm.fit)$delta

# Write function for loocv
loocv=function(fit){
 h=lm.influence(fit)$h
 mean((residuals(fit)/(1-h))^2)
}

## Let's try it out
loocv(glm.fit)

# Let's fit polynomials of different degrees
# to our data
cv.error=rep(0,5)

degree=1:5
for(d in degree){
  glm.fit=glm(mpg~poly(horsepower, d), data=Auto)
  cv.error[d]=loocv(glm.fit)
}

plot(degree, cv.error, type='b')

## 10-fold cv
cv.error10=rep(0,5)
for(d in degree){
  glm.fit=glm(mpg~poly(horsepower, d), data=Auto)
  cv.error10[d]=cv.glm(Auto, glm.fit,K=10)$delta[1]
}

lines(degree, cv.error10, type='b', col='red')

