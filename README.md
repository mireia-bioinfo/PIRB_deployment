# IRB docker 

## Docker pipeline for deploying the IRB

### Devel local testing

Uncomment the line on the regulome Dockerfile to download the datasets internally in the regulome image: `RUN R -f devel_install_database.R`.

Run the following build the image and run it to be able to access the regulome from your browser:

```
docker build -t regulome:devel . --no-cache
docker run -p 80:3838 regulome:devel
```

Go to [http://127.0.0.1:80](http://127.0.0.1:80) and explore the islet regulome browser.

### Deployment on regulome server

When changes are made to the two IRB github repositories: 
```
docker login
cd regulome
docker build -t mramos490/regulome:v1.1.2 . --no-cache
docker push mramos490/regulome:v1.1.2
```

Then, `ssh user@regulome` and run:
```
cd regulome/
docker login
docker pull mramos490/regulome:v1.1.2
```

Next, the file `docker-compose.yml` should be modified to use the current version of the regulome image. Once it is changes, run:
```
docker-compose stop && docker-compose pull && docker-compose up 2>&1 > /var/log/docker-compose.log &
```

## Docker images structure
In order to generate the final regulome docker image, one need to create several parent images. The original docker image used to generate the rest is `debian:jessie`. 

### 1) `rdeps`
The `Dockerfile` contained in this folder will install all the necessary dependencies to later run R. Also includes some fonts installations to be able to render the correct output for the plots in the IRB shiny site.

### 2) `rbase`
In this stage, using `rdeps:latest` as parent image, docker will donwload the compressed R version from [](cran.r-project.org). If you wants to change the R version to download, you just need to change the version number in the line that downloads the compressed R installation. 

```
RUN curl https://cran.r-project.org/src/base/R-3/R-3.5.1.tar.gz # R 3.5.1
# update R
RUN curl https://cran.r-project.org/src/base/R-3/R-3.6.0.tar.gz # R 3.6.0
```

In this case, given that specific versions of R are being used, is good practice to tag every rbase image with the version of R using, such as `rbase:3.5.1`.

### 3) `biocbase`
This docker image will use the previous image with the R installation (`rbase:3.5.1`) to install [Bioconductor](http://www.bioconductor.org/) and all required dependencies. It is also good practice to tag it with the Bioconductor version it is using, such as `biocbase:3.8`.

### 4) `regulomedeps`
Once the installation of R and Bioconductor is successful, the `regulomedeps` image should be generated using as parent the `biocbase` image. In this step, all necessary packages for running the `isletregulome_shiny` and `plotRegulome` packages should be installed. 

This will allow for the next image, `regulome`, to be generated in less time if only changes to the code are made. This image will generally take a considerable amount of time to be generated.

### 5) `regulome`
This is the final image in which, using `regulomedeps` as parent, will clone the git repositories for the [`isletregulome_shiny`](https://github.com/mireia-bioinfo/isletregulome_shiny) and [`plot_regulome`](https://github.com/mireia-bioinfo/plotRegulome/), install the `plot_regulome` package and then do all necessary steps to be able to run the IRB site.

As docker by default only compiles the image when changes are made to the Dockerfile, in this case one should run the build command with `--no-cache`, allowing it to download the data from the git repository again even though no changes to the Dockerfile are being made.
