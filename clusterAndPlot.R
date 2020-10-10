install.packages("tidyverse")
install.packages("cluster")
install.packages("factoextra")
install.packages("dendextend")
install.packages("ape")

library(tidyverse)
library(cluster)
library(factoextra)
library(dendextend)

# matrix <- as.matrix(read.csv(file='data/dissimilarityMatrix.csv', header=F))
matrix<-read.table("data/dissimilarityMatrix.txt", sep=" ", na.strings = "" ,fill=TRUE)
colnames(matrix) <- c(
  "E. coli (K-12 MG1655)",
  "E. coli (LB226692) O104:H4", 
  "E. coli (K1516) O157:H7", 
  "Shigella Flexerni (2457T) 2a", 
  "E. coli (EC4024) O157:H7", 
  "E. coli (EDL933) O157:H7", 
  "E. coli (K-12 MG655)", 
  "E. coli (Sakai) O157:H7", 
  "E. coli (E24377A) O139:H28", 
  "E. coli (CFT073)", 
  "Salmonella Entrica (2017K-0021) enteritidis", 
  "Salmonella Entrica (UK-1) Typhimurium", 
  "Salmonella Entrica (CFSAN001387) Tennessee", 
  "E. coli (C236-11) O104:H4", 
  "E. coli (11-4632 C5) O104:H4"
  )
dissimilarityMatrix <- as.dist(matrix)

# Hierarchical clustering using Complete Linkage
hc <- hclust(dissimilarityMatrix, method = "complete" )

# Plot the obtained dendrogram
# Note: Can specify `hang = -1` to put all labels at the bottom of the chart
plot(hc)

library("ape")


plot(as.phylo(hc), cex = 0.6, label.offset = 0.5)

plot(as.phylo(hc), type = "cladogram", cex = 0.6, 
     label.offset = 0.5)

plot(as.phylo(hc), type = "unrooted", cex = 0.6,
     no.margin = TRUE)

plot(as.phylo(hc), type = "fan")

plot(as.phylo(hc), type = "radial")

# cluster




colors = c("red", "blue", "green", "purple", "orange", "deeppink", "brown")
clus4 = cutree(hc, 8)

ph = as.phylo(hc)
ph[["edge.length"]] = log2((ph[["edge.length"]]) * 1000000 + 1.2) ** 2

plot(ph, type = "phylogram", tip.color = colors[clus4],
     label.offset = 0.001, cex = 1, use.edge.length=TRUE)

plot(ph, type = "unrooted", tip.color = colors[clus4],
     label.offset = 0.1, cex = 1, use.edge.length=TRUE)





plot(as.phylo(hc), type = "phylogram", tip.color = colors[clus4],
     label.offset = 0.001, cex = 1, use.edge.length=TRUE)

plot(ph, type = "cladogram", tip.color = colors[clus4],
     label.offset = 0.001, cex = 1, use.edge.length=TRUE)

plot(ph, type = "fan", tip.color = colors[clus4],
     label.offset = 0.001, cex = 1, use.edge.length=TRUE)

plot(ph, type = "radial", tip.color = colors[clus4],
     label.offset = 0.001, cex = 1, use.edge.length=TRUE)

plot(ph, type = "unrooted", tip.color = colors[clus4],
     label.offset = 0.001, cex = 1, use.edge.length=TRUE)





plot(as.phylo(hc), type = "fan", tip.color = colors[clus4],
     label.offset = 0.001, cex = 0.7)

plot(as.phylo(hc), type = "cladogram", cex = 0.6,
     edge.color = "steelblue", edge.width = 2, edge.lty = 2,
     tip.color = "steelblue")









