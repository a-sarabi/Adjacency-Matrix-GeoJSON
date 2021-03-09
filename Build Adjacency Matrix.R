library(rgeos)
library(rgdal)
polys <- readOGR("D:/boston_taz-Edited.json")
polys2  <- gBuffer(polys , byid=TRUE, width=0)

adj <- gIntersects(polys2, byid = TRUE, returnDense=TRUE, checkValidity=TRUE)
write.csv(adj ,"adj.csv")
