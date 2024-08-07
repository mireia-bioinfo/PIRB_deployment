 FROM bioconductor/bioconductor_docker:RELEASE_3_11

# For reference: https://vsupalov.com/build-docker-image-clone-private-repo-ssh-key/
LABEL version="Regulome"
LABEL description="Running regulome app under docker"
LABEL maintainer "Mireia Ramos-Rodriguez <mireia.ramos@upf.edu>"
# this docker container shouldn't need to install anything but the data from the git repository

# Install package deps --------------------------
RUN R -e "BiocManager::install(c('shiny', 'shinycssloaders', 'shinyjs', 'shinythemes', 'markdown', 'GenomicRanges', 'DT', 'magrittr', 'formattable'))"

# Install plot regulome package------------------

RUN R -e "BiocManager::install('mireia-bioinfo/plotRegulome')"

# Clone shiny app -------------------------------
USER root
RUN mkdir /root/regulome
WORKDIR /root/regulome

ADD "https://api.github.com/repos/mireia-bioinfo/PIRB_shinyApp/commits?per_page=1" latest_commit
RUN curl -sLO "https://github.com/mireia-bioinfo/PIRB_shinyApp/archive/master.zip" && unzip master.zip
RUN mv PIRB_shinyApp-master PIRB_shinyApp

#RUN git clone https://github.com/mireia-bioinfo/PIRB_shinyApp.git

RUN rm /root/regulome/PIRB_shinyApp/runIsletRegulome.R

# Other configuration ---------------------------
COPY Rprofile.site /usr/lib/R/etc/

RUN ls /root/regulome/PIRB_shinyApp/

## Favicon
#RUN mkdir -p /www/
#RUN cp /home/docker/tools/isletregulome_shiny/www/favicon.ico /www/favicon.ico

EXPOSE 3838

CMD ["R", "-e", "shiny::runApp('/root/regulome/PIRB_shinyApp',  host='0.0.0.0', port = 3838)"]
