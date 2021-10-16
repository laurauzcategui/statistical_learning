# Statistical Learning 

This repository contain Exercises and Projects from [Statistical Learning STATSX0001 @ Stanford Online - edX](https://www.edx.org/course/statistical-learning)

There is a website with the book which is a really good reference you can check on the course: https://www.statlearning.com/

## Structure of the repo. 

Each folder contains the relevant exercises for the chapter

- [Chapter 04 - Classification](./04_classification)
- [Chapter 05 - Resampling Methods](./05_crossvalidation)
- [Chapter 06 - Model Selection and Regularization ](./06_regularization)

## Build the docker image with RStudio
```
cd scripts/
docker build -t rocker .
```

## Running RStudio with Docker container
 docker run -d -p 8787:8787 -v $PWD:/data -e PASSWORD=[YourPassword] --name rocker rocker