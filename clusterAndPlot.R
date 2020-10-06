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
colnames(matrix) <- c("s1", "s2", "s3", "s4", "s5")
dissimilarityMatrix <- as.dist(matrix)

# Hierarchical clustering using Complete Linkage
hc <- hclust(dissimilarityMatrix, method = "complete" )

# Plot the obtained dendrogram
# Note: Can specify `hang = -1` to put all labels at the bottom of the chart
plot(hc)

