# statistical_learning
Exercises and Projects from Statistical Learning STATSX0001

## Build the docker image with RStudio
```
cd scripts/
docker build -t rocker .
```

## Running RStudio with Docker container
 docker run -d -p 8787:8787 -v $PWD:/data -e PASSWORD=[YourPassword] --name rocker rocker