FROM biocbase:3.8

LABEL version="Regulomedeps"
LABEL description="Container with the dependencies speced by MRamos for Regulome shiny app"

USER root

ADD install_regulomedeps.R /tmp/
RUN R -f /tmp/install_regulomedeps.R && rm -f /tmp/install_regulomedeps.R

USER docker
RUN mkdir /home/docker/regulomeapp

WORKDIR /home/docker/regulomeapp
