# template taken from bioconductor
# https://github.com/Bioconductor/bioc_docker/blob/master/out/release_core/install.R
library(BiocInstaller)

#
cores <- parallel::detectCores()
options(Ncpus = cores)
pkglist <- c(
             )


biocLite(pkglist)

