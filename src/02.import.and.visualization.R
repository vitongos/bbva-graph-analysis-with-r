library(igraph) 

###
# 1. Load graph from edgelist
###


reports.to <- read.csv('/home/centos/graph-src/data/reports.to.edgelist.txt', header = F)
edge.list <- as.matrix(reports.to)
edge.list
g <- graph.edgelist(edge.list, directed = F)
g


###
# 2. Load attributes from csv
###

attributes <- read.csv('/home/centos/graph-src/data/attributes.csv', header = T)
attributes
V(g)$age <- attributes$AGE
V(g)$tenure <- attributes$TENURE
V(g)$level <- attributes$LEVEL
V(g)$department <- attributes$DEPT
g


###
# 3. Change vertex colors and sizes
###


V(g)$color <- as.numeric(factor(V(g)$department))
V(g)$size <- V(g)$tenure


plot(g, 
     layout = layout.fruchterman.reingold, 
     vertex.label = NA)


###
# 4. Export plots
###


setwd("/tmp")
pdf("reports.color.pdf") 
par(mfrow = c(2, 2))
lyt <- layout.fruchterman.reingold(g)
plot(g, 
     layout = lyt, 
     vertex.label = NA, 
     vertex.size = V(g)$tenure,
     main = "Tenure distribution")
plot(g, 
     layout = lyt, 
     vertex.label = NA, 
     vertex.size = V(g)$age / 3,
     main = "Age distribution")
dev.off() 

