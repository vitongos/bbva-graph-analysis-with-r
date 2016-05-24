library(igraph) 


###
# 1. Create sample graph
###


sg <- sample_pa(40, directed = F)
V(sg)$size <- 12
V(sg)$label <- NA
V(sg)$frame.color <- "dark blue"
V(sg)$color <- "light blue"
E(sg)$arrow.mode <- 0
E(sg)$color <- "black"
lyt <- layout.fruchterman.reingold(sg)
plot(sg, layout = lyt)


###
# 2. Centralities
###


degree.centrality <- degree(sg)
V(sg)$label <- degree.centrality
plot(sg, layout = lyt)


betwenness.centrality <- betweenness(sg)
V(sg)$label <- betwenness.centrality
plot(sg, layout = lyt)


closeness.centrality <- closeness(sg)
V(sg)$label <- round(closeness.centrality, 6) * 100
plot(sg, vertex.label.cex = .7, layout = lyt)


eigenvector.centrality <- eigen_centrality(sg)$vector
V(sg)$label <- round(eigenvector.centrality, 2)
plot(sg, layout = lyt)


###
# 3. Diameter, paths, density, transitivity
###


diameter(sg)

all_shortest_paths(sg, 7)

farthest_vertices(sg)

edge_density(sg)

transitivity(sg)


###
# 4. Communities and cliques
###


network.community <- fastgreedy.community(sg)
modularity(network.community)
plot(network.community, sg, layout = lyt)


network.community <- walktrap.community(sg)
modularity(network.community)
plot(network.community, sg, layout = lyt)


network.community <- cluster_infomap(sg)
modularity(network.community)
plot(network.community, sg, layout = lyt)


network.community <- cluster_leading_eigen(sg)
modularity(network.community)
plot(network.community, sg, layout = lyt)


nodes <- read.csv("/home/centos/graph-src/data/media.sample.nodes.csv", header = T, as.is = T)
edges <- read.csv("/home/centos/graph-src/data/media.sample.edges.csv", header = T, as.is = T)
g <- graph.data.frame(vertices = nodes, d = edges, directed = F)
g <- simplify(g)


cliques(g, min = 4, max = 8)
largest.cliques(g)
plot(g)
