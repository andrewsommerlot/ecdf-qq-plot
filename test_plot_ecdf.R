# test the function 
#install.packages('ggplot2')
#install.packages('reshape2')
#install.packages('Rmisc')

library(ggplot2)
library(reshape2)
library(Rmisc)

#get some example data for ecdf example
a <- runif(100, 0, 100)
b <-runif(100, 0, 100)
c <-runif(100, 0, 100)
d <- runif(100, 0, 100)
e <- runif(100, 0, 100)

dat <- data.frame(a,b,c,d,e)

plot_ecdf(dat)

#get some example data for qq plot example
dat1 = data.frame(a = runif(100, 0, 100), b = runif(100, 0, 100), c = runif(100, 0, 100))
dat2 = data.frame(a = runif(100, 0, 100), b = runif(100, 0, 100), c = runif(100, 0, 100))
dat3 = data.frame(a = runif(100, 0, 100), b = runif(100, 0, 100), c = runif(100, 0, 100))
dat_list = list(dat1, dat2, dat3)

plot_qq_compare_multi(dat_list, legend_names = c('corrected', 'uncorrected'), out_dir = 'C:/Users/Andy/Desktop/spatial_val')