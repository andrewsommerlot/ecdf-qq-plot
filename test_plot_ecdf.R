# test the function 
#install.packages('ggplot2')
#install.packages('reshape2')
library(ggplot2)
library(reshape2)

#get some example data
a <- runif(100, 0, 100)
b <-runif(100, 0, 100)
c <-runif(100, 0, 100)
d <- runif(100, 0, 100)
e <- runif(100, 0, 100)

dat <- data.frame(a,b,c,d,e)

plot_ecdf(dat)
