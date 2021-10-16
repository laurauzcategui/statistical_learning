FROM rocker/rstudio:4.1.1

# Install some basic utilities
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    wget \
    vim \
 && rm -rf /var/lib/apt/lists/*

# Create a working directory
ARG user=rstudio
ARG datadir=/data

RUN mkdir $datadir
WORKDIR $datadir

# Create a non-root user and switch to it
RUN chown -R $user:$user $datadir

RUN apt update

# Install packages
RUN install2.r tidyverse
RUN install2.r ISLR2
RUN install2.r leaps
RUN install2.r --repos "https://cran.us.r-project.org"


# All users can use /home/user as their home directory
ENV HOME=/home/$user

# Copy profile
COPY .Rprofile /home/rstudio/

# Set volume and workdir to be $datadir
VOLUME $datadir
WORKDIR $datadir
