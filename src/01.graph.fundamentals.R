library(igraph) 

###
# 1. Load data from vector
###


g <- graph(c("A","B" , "B","C" , "B","D" , "D","E"))
g
plot(g)
is.directed(g)
vcount(g)
ecount(g)


g <- graph(edges = c(1,2 , 2,3 , 3,4 , 1,4 , 1,5), n = 10)
g
plot(g)


g <- graph(c("A","B" , "B","C" , "B","D" , "D","E"), isolates = c("F", "G", "H"))
plot(g)


g <- graph(c("A","B" , "B","C" , "B","D" , "D","E"), directed = F)
g
plot(g)
is.directed(g)


E(g)
length(E(g))
V(g)
length(V(g))


g <- graph(c("A","B" , "B","C" , "B","D" , "D","E"))
g[]


###
# 2. Graph visualization
###


g <- graph.tree(40, 4)
plot(g)


g <- graph(c("A","B" , "B","C" , "B","D" , "D","E"))
plot(g, 
     edge.arrow.size = .5, 
     vertex.color = "gold", 
     vertex.size = 15, 
     vertex.frame.color = "gray", 
     vertex.label.color = "black", 
     vertex.label.cex = .8, 
     vertex.label.dist = 2, 
     edge.curved = .2)


###
# 3. Vertex and edges attributes
###


V(g)$name
V(g)$country <- c("Spain", "Mexico", "Mexico", "USA", "Spain")
g
vertex_attr(g)


nf = as.numeric(factor(V(g)$country))
plot(g, 
     edge.arrow.size = .5, 
     vertex.label.dist = 2, 
     vertex.label.color = "black", 
     vertex.color = c("tan3", "skyblue", "dark red")[nf])


E(g)$type <- "person" 
E(g)$weight <- 10 
g
E(g)$type
edge_attr(g)


###
# 4. Load graph from data frame, edgelist, matrix
###


nodes <- read.csv("/home/centos/graph-src/data/media.sample.nodes.csv", header = T, as.is = T)
edges <- read.csv("/home/centos/graph-src/data/media.sample.edges.csv", header = T, as.is = T)
g <- graph.data.frame(vertices = nodes, d = edges)
g
plot(g)


reports.to <- read.csv('/home/centos/graph-src/data/reports.to.edgelist.txt', header = F)
edge.list <- as.matrix(reports.to)
g <- graph.edgelist(edge.list, directed = F)
plot(g)


reports.to <- read.table('/home/centos/graph-src/data/reports.to.matrix.txt', header = T, row.names = 1, check.names = F)
matrix <- as.matrix(reports.to)
g <- graph.adjacency(matrix, mode = "undirected")
plot(g)


###
# 5. Sample graphs
###


eg <- make_empty_graph(40)
plot(eg, vertex.size = 10, vertex.label = NA)


fg <- make_full_graph(40)
plot(fg, vertex.size = 10, vertex.label = NA, edge.color = "black")


st <- make_star(40)
plot(st, vertex.size = 10, vertex.label = NA, edge.color = "black") 


tr <- make_tree(40, children = 3, mode = "undirected")
plot(tr, vertex.size = 10, vertex.label = NA, edge.color = "black") 


ri <- make_ring(40)
plot(ri, vertex.size = 10, vertex.label = NA, edge.color = "black") 


er <- sample_gnm(n = 40, m = 40) 
plot(er, vertex.size = 5, vertex.label = NA, edge.color = "black")


sw <- sample_smallworld(dim = 2, size = 10, nei = 1, p = 0.03)
plot(sw, vertex.size = 5, vertex.label = NA, edge.color = "black")


###
# 6. Layouts
###


sg <- sample_pa(80)
V(sg)$size <- 5
V(sg)$label <- NA
V(sg)$frame.color <- "dark blue"
V(sg)$color <- "light blue"
E(sg)$arrow.mode <- 0
E(sg)$color <- "black"
plot(sg)


plot(sg, layout = layout.auto)
plot(sg, layout = layout.random)


plot(sg, layout = layout.fruchterman.reingold)
plot(sg, layout = layout.circle)
plot(sg, layout = layout.graphopt)
plot(sg, layout = layout.kamada.kawai)
plot(sg, layout = layout.davidson.harel)
plot(sg, layout = layout.grid.3d)
plot(sg, layout = layout.grid)
plot(sg, layout = layout_on_sphere)


g <- graph(c("A","B" , "B","C" , "B","D" , "D","E"))
lyt <- cbind(c(1, 3, 2, 5, 4), c(2, 2, 3, 1, 5))
lyt
plot(g, layout = lyt)


lyt <- layout.fruchterman.reingold(sg)
lyt
plot(sg, layout = lyt)


set.seed(123)
plot(sg, layout = layout.fruchterman.reingold)
V(sg)$color <- "dark blue"
set.seed(123)
plot(sg, layout = layout.fruchterman.reingold)

