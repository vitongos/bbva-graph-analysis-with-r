library(igraph) 
library(maps)
library(ggmap)


###
# 1. Load data frames from files
###


nodes <- read.csv("/home/centos/graph-src/data/nodes.csv", header = T, as.is = T)
edges <- read.csv("/home/centos/graph-src/data/relationships.csv", header = T, as.is = T)


###
# 2. Filter nodes for France and create graph
###


nodes <- nodes[nodes$country == "France",]
filter <- edges$id1 %in% nodes$id & edges$id2 %in% nodes$id
edges <- edges[filter,]
codes <- geocode(paste(nodes$city, ", ", nodes$country, sep = ""))
nodes <- cbind(nodes, codes)
g <- graph.data.frame(vertices = nodes, d = edges)
g


#
# 3. Plot graph on the map
#


lyt <- as.matrix(nodes[,9:10])
map('world', 'france')
plot.igraph(g, 
            layout = lyt, 
            xlim = c(-5, 8), 
            ylim = c(40, 51), 
            rescale = F, 
            vertex.size = 16,
            vertex.label.cex = 0.5, 
            vertex.label = NA, 
            edge.arrow.size = 0,
            edge.curved = T,
            edge.color = 'black',
            add = T)