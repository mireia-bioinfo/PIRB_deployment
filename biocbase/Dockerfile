FROM rbase:3.4.4

LABEL version="R-3.4.4 Bioc 3.5"
LABEL description="Base bioconductor 3.5 install for R 3.4.4"

USER root

RUN R -e 'cores <- parallel::detectCores(); options(Ncpus = cores);source("https://bioconductor.org/biocLite.R"); biocLite()'

USER docker
WORKDIR /home/docker
