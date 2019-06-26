# template taken from bioconductor
# https://github.com/Bioconductor/bioc_docker/blob/master/out/release_core/install.R
library(BiocInstaller)

#
cores <- parallel::detectCores()
options(Ncpus = cores)
pkglist <- c(
             "shiny",
             "shinythemes",
             "ggplot2",
             "cowplot",
             "Hmisc",
             "GenomicRanges",
             "ggbio",
             "Rsamtools",
             "rtracklayer",
             "shinycssloaders",
             "shinyjs",
             "magrittr",
             "Homo.sapiens",
             "regioneR",
             "scales",
             "ggrepel",
             "dplyr",
             "DT",
             "devtools",
             "roxygen2",
             "ggrepel",
             "formattable",
             "markdown",
             "purr",
             "tidyselect",
             "Hmisc",
             "shinyjs"
             )


biocLite(pkglist)

