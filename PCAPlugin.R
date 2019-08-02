# Clear R workspace
#rm(list=ls(all=TRUE))
library(ggbiplot)

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1]

  group <<- c()
  #legend <<- c()

  data1 <<- c()
  data2 <<- c()
  data1 <<- read.csv(toString(parameters["input1",2]), header=T, row.names=1)
  for (i in 1:nrow(data1)) {
     group <<- rbind(group, "A - Healthy")
     #legend <<- rbind(legend,1)
  }
  data2 <<- read.csv(toString(parameters["input2",2]), header=T, row.names=1)
  for (i in 1:nrow(data2)) {
     group <<- rbind(group, "B - Disease")
     #legend <<- rbind(legend,1)
  }
  data_t <<- data.frame(rbind(data1, data2))
  names_t <<- rownames(data_t)#c()
}


run <- function() {
#######
# PCA #
#######
data.pca <<- prcomp(data_t, center=TRUE)

   
}

output <- function(outputfile) {
   #plot(data.pca, type="lines", file=toString(parameters["varianceplot",2]))
   #write.csv(data.pca$x, toString(parameters["plotdata",2]))
   #write.csv(data.pca$rotation, toString(parameters["rotationdata",2]))
   #plot(data.pca, type="lines", file=paste(outputfile, ".variance.pdf", sep=""))
   write.csv(data.pca$x, file=paste(outputfile, ".plotdata.csv", sep=""))
   write.csv(data.pca$rotation, file=paste(outputfile, ".rotation.csv", sep=""))

   dpi=600
   pdf(file=paste(outputfile, ".graph.pdf", sep=""))
   g <- ggbiplot(data.pca, obs.scale = 1, var.scale = 1,
              ellipse = TRUE, ellipse.prob = 0.80, groups=group,
              labels = names_t, 
              circle = FALSE, var.axes=FALSE, alpha=0)
   g <- g + geom_point(aes(shape=groups,colour=groups),size = 4)
   g <- g + theme(legend.direction = 'horizontal', 
               legend.position = 'top')
   g <- g + scale_color_manual(name='Class', values=c('#9900ff','#0000ff','#009933', '#000000', '#ff0000'))
   g <- g + scale_shape(name='Class')
   print(g);
   dev.off();
}
