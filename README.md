# Docker image for Thermo-Hydro-Mechanical code
> Krishna Kumar

[![Quay image](https://img.shields.io/badge/quay--image-cbgeo--thm-ff69b4.svg)](https://quay.io/repository/cbgeo/thm)
[![CircleCI](https://circleci.com/gh/cb-geo/thm-container.svg?style=svg)](https://circleci.com/gh/cb-geo/thm-container)
[![](https://images.microbadger.com/badges/image/cbgeo/thm.svg)](http://microbadger.com/images/cbgeo/thm)

## Tools
* Clang 6.0
* CMake 3
* Dealii - 9.1
* Eigen 3
* GCC 8
* Vim
* IntelTBB

# Using the docker image
* The docker image can be used directly from the Docker Hub or Quay.io
* Pull the docker image `docker pull cbgeo/thm` or `docker pull quay.io/cbgeo/thm`
* To launch the `cbgeo/thm`  docker container, run `docker run -ti cbgeo/thm:latest /bin/bash` or `docker run -ti quay.io/cbgeo/thm:latest /bin/bash`

# To login as root
* Launching docker as root user: `docker exec -u 0 -ti <containerid> /bin/bash`

# Creating an image from the docker file
* To build an image from docker file run as root `docker build -t "cbgeo/thm" /path/to/Dockerfile`
* `docker history` will show you the effect of each command has on the overall size of the file.
