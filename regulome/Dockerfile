FROM mramos490/regulomedeps:latest

# For reference: https://vsupalov.com/build-docker-image-clone-private-repo-ssh-key/
LABEL version="Regulome"
LABEL description="Running regulome app under docker"
# this docker container shouldn't need to install anything but the data from the git repository

USER docker
RUN mkdir -p /home/docker/tools/
WORKDIR /home/docker/tools/
RUN git clone https://github.com/mireia-bioinfo/isletregulome_shiny.git \
  && git clone https://github.com/mireia-bioinfo/plotRegulome.git

USER root
RUN chown -R docker /home/docker
RUN R CMD INSTALL plotRegulome

USER root
RUN chown -R docker /home/docker

## Favicon
RUN mkdir -p /www/
RUN cp /home/docker/tools/isletregulome_shiny/www/favicon.ico /www/favicon.ico

## Fonts
#RUN mkdir -p /home/docker/.fonts
#RUN cp -r /home/docker/.fonts /fonts
#COPY fonts /home/docker/.fonts

USER docker
RUN mkdir /home/docker/tools/isletregulome_shiny/static_data
 
WORKDIR /home/docker/tools/isletregulome_shiny
  
CMD ["R", "-f", "runIsletRegulome.R"]
