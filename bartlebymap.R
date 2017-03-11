library("ggplot2")
library("png")
library("jpeg")
library("gridGraphics")
library(RCurl)


myurl <- 
my_image <-  readJPEG(getURLContent(myurl))

bartleby <- read_csv("~/Documents/WhitmanAtlas/bartleby.csv")
images <- sapply(bartleby$links, function(x){
  readJPEG(getURLContent(x))
})

reorder(bartleby, order(bartleby$count))

qplot(1:10, 1:10, geom="blank") +
  annotation_raster(images[[1]], xmin=0, xmax=0.1*bartleby$count[1], ymin=0, ymax=0.1*bartleby$count[1]) +
  annotation_raster(images[[2]], xmin=0, xmax=0.1*bartleby$count[2], ymin=0, ymax=0.1*bartleby$count[2])
