install.packages("tidyverse")
install.packages("cluster")
install.packages("factoextra")
install.packages("dendextend")

library(tidyverse)
library(cluster)
library(factoextra)
library(dendextend)

# matrix <- as.matrix(read.csv(file='data/dissimilarityMatrix.csv', header=F))
matrix<-read.table("data/dissimilarityMatrix.txt", sep=" ", na.strings = "" ,fill=TRUE)
colnames(matrix) <- c("LR881938", "CP024992", "CP049612", "AE014073", "DS571135", "CP028305", "CP028306", "CP028307", "CP028308", "CP028309", "CP030794", "CP002614", "CP014994", "JH378079", "JH377984")
dissimilarityMatrix <- as.dist(matrix)

# Hierarchical clustering using Complete Linkage
hc <- hclust(dissimilarityMatrix, method = "complete" )

# Plot the obtained dendrogram
# Note: Can specify `hang = -1` to put all labels at the bottom of the chart
plot(hc)

