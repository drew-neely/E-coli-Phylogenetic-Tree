
# uncomment this to install the packages

#if (!requireNamespace("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
#BiocManager::install()
#BiocManager::install(c("AnnotationHub", "ShortRead", "Biostrings"))

library(Biostrings)
library(AnnotationHub)
library(ShortRead)

fa = readFasta(dirPath = "data/1.fasta")
getSeq(fa)
sread(fa)
id(fa)
