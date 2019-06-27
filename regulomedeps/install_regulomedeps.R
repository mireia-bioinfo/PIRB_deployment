# template taken from bioconductor
# https://github.com/Bioconductor/bioc_docker/blob/master/out/release_core/install.R
library(BiocManager)

#
cores <- parallel::detectCores()
options(Ncpus = cores)
pkglist <- c(
             "shiny",
             "shinythemes",
             "shinycssloaders",
             "shinyjs",
             "cowplot",
             "Hmisc",
             "GenomicRanges",
             "rtracklayer",
             "regioneR",
             "scales",
             "ggrepel",
             "dplyr",
             "DT",
             "devtools",
             "roxygen2",
             "formattable",
             "markdown",
             "tidyselect",
             "extrafonts"
             )

install(pkglist)

