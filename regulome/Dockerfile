FROM mramos490/regulomedeps:latest

# For reference: https://vsupalov.com/build-docker-image-clone-private-repo-ssh-key/
LABEL version="Regulome"
LABEL description="Running regulome app under docker"
# this docker container shouldn't need to install anything but the data from the git repository

USER docker
RUN mkdir -p /home/docker/tools/
WORKDIR /home/docker/tools/
RUN git clone -b devel https://github.com/mireia-bioinfo/isletregulome_shiny.git \
  && git clone -b devel https://github.com/mireia-bioinfo/plotRegulome.git

USER root
RUN chown -R docker /home/docker
RUN R CMD INSTALL plotRegulome

USER root
RUN chown -R docker /home/docker

## Favicon
RUN mkdir -p /www/
RUN cp /home/docker/tools/isletregulome_shiny/www/favicon.ico /www/favicon.ico

USER docker

WORKDIR /home/docker/tools/isletregulome_shiny

## For devel version
# RUN R -f devel_install_database.R 
   
CMD ["R", "-f", "runIsletRegulome.R"]
