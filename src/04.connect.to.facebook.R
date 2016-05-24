library(Rfacebook) 


###
# 1. Connect to Facebook
###


# Generate token: https://developers.facebook.com/tools/explorer 
token <- 'XXXXXXXXXX'
me <- getUsers("me", token, private_info = T)
me$name


###
# 2. Gather basic info
###


# Get list of friends
friends <- getFriends(token)
friends


# Get adjacency matrix
mat <- getNetwork(token, format = "adj.matrix")
mat


# Get news feed
news <- getNewsfeed(token)
news
