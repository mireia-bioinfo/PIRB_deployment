FROM rbase:3.5.1

LABEL version="R-3.5.1 Bioc 3.8"
LABEL description="Base bioconductor 3.8 install for R 3.5.1"

USER root

RUN R -e 'cores <- parallel::detectCores(); options(Ncpus = cores);install.packages("BiocManager", repos="https://cran.r-project.org");BiocManager::install()'

USER docker
WORKDIR /home/docker
