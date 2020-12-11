# Deployment of the Pancreatic Islet Regulome Browser using Docker and Shinyproxy

The Pancreatic Islet Regulome Browser (PIRB) is a web application that allows interactive exploration of regulatory data from pancreatic islets and other relevant tissues. It is implemented as a Shiny R Application (https://shiny.rstudio.com/) that uses a `plotRegulome`  custom R package (https://github.com/mireia-bioinfo/plotRegulome) and the PIRB database to produce the user-requested plots.

## Contents of this repository

This repository contains information and code on how the PIRB app is deployed: 

1. **Shiny app docker image**. A Docker image containing the necessary dependencies and the shiny app code is created. This docker image can be ran directly to serve the PIRB shiny app, by mounting the volume including the PIRB database (code in folder `docker_shinyAPP`).

2. **Shinyproxy docker image**. Even though the shiny app docker image can be used directly, we implemented in using shinyproxy in order to allow multiple users to have independent sessions. Shinyproxy is implemented using its own docker image that runs shinyproxy, which in turn creats new containers for the shiny app image for each new user (code in folder `docker_shinyProxy`).

## Usage instructions

1. Build shiny app docker image.
```
cd docker_shinyApp
docker build . -t pirb-nodata
```
To test that the docker image works, we can run it directly:
```
docker run -d -p 3838:3838 -v /home/regulome/PIRB_database:/root/regulome/isletregulome_shiny/IRB_database pirb-nodatadocke
```

2. Create internal network to allow container communication.
```
docker network create pirb-net
```

3. Build shinyproxy docker image.
```
cd docker_shinyProxy
docker build . -t shinyproxy-pirb
```

4. Run shinyproxy docker image.
```
docker run -d -v /var/run/docker.sock:/var/run/docker.sock --net pirb-net -p 8080:8080 -v /home/regulome/shinyproxylogs:/opt/shinyproxy/logs shinyproxy-pirb
```


## Other usefool tools

Test stuff:

```
docker ps # Check containers running
docker exec -it <cont-id> /bin/bash # Interactive session in running container
```