# Deployment of the Pancreatic Islet Regulome Browser using Docker and Shinyproxy

The Pancreatic Islet Regulome Browser (PIRB) is a web application that allows interactive exploration of regulatory data from pancreatic islets and other relevant tissues. It is implemented as a Shiny R Application^[shiny] that uses a `plotRegulome`^[plotRegulome] custom R package and the PIRB database to produce the user-requested plots.

This repository contains information and code on how the PIRB app is deployed: 

1. **Shiny app docker image**. A Docker image containing the necessary dependencies and the shiny app code is created. This docker image can be ran directly to serve the PIRB shiny app, by mounting the volume including the PIRB database (code in folder `docker_shinyAPP`).

2. **Shinyproxy docker image**. 


[shiny]: https://shiny.rstudio.com/
[plotRegulome]: https://github.com/mireia-bioinfo/plotRegulome
