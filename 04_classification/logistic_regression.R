require(ISLR2)
names(Smarket)

?Smarket

# Plot Smarket
pairs(Smarket, col=Smarket$Direction)

# Logistic Regressiom
glm.fit = glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume, data=Smarket, family = binomial)

# Get summary
summary(glm.fit)

glm.probs = predict(glm.fit, type="response")

# Gives a vector of fitted probabilities
glm.probs[1:5]

# Decision boundary 
glm.pred=ifelse(glm.probs>0.5, "Up", "Down")

attach(Smarket)

# Get confusion matrix 
table(glm.pred, Direction)

# Get mean clasification performance
mean(glm.pred==Direction)

# make Training and test set
train = Year <2005 

# Logistic Regressiom
glm.fit = glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume, data=Smarket, 
              family = binomial,
              subset=train)

# Predict on test set [!train]
glm.probs = predict(glm.fit, newdata = Smarket[!train,], type="response")

# Gives a vector of fitted probabilities
glm.probs[1:5]

# Decision boundary 
glm.pred=ifelse(glm.probs>0.5, "Up", "Down")

# Let's make a response variable with test set
Direction.2005 = Direction[!train]

# Get confusion matrix 
table(glm.pred, Direction.2005)

# Get mean classification performance
mean(glm.pred==Direction.2005)

# We might overfitting. 
# let's do in a smaller model
# Logistic Regressiom
glm.fit = glm(Direction~Lag1+Lag2, data=Smarket, 
              family = binomial,
              subset=train)

# Predict on test set [!train]
glm.probs = predict(glm.fit, newdata = Smarket[!train,], type="response")

# Gives a vector of fitted probabilities
glm.probs[1:5]

# Decision boundary 
glm.pred=ifelse(glm.probs>0.5, "Up", "Down")

# Let's make a response variable with test set
Direction.2005 = Direction[!train]

# Get confusion matrix 
table(glm.pred, Direction.2005)

# Get mean classification performance
mean(glm.pred==Direction.2005)

# Accuracy improved: 55% compared to 48% 

summary(glm.fit)
