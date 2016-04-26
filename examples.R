# test the function 
#install.packages('ggplot2')
#install.packages('reshape2')
#install.packages('Rmisc')

library(ggplot2)
library(reshape2)
library(Rmisc)

# to change the size and theme of ggplots globally: 
theme_set(theme_gray(base_size = 22))

###################################################################################
# Example data for plot_ecdf example

a <- runif(100, 0, 100)
b <-runif(100, 0, 100)
c <-runif(100, 0, 100)
d <- runif(100, 0, 100)
e <- runif(100, 0, 100)

dat <- data.frame(a,b,c,d,e)

plot_ecdf(dat)

###################################################################################
# Example data for plot_qq_comparison_multi plot example

dat1 = data.frame(a = runif(100, 0, 100), b = runif(100, 0, 100), c = runif(100, 0, 100))
dat2 = data.frame(a = runif(100, 0, 100), b = runif(100, 0, 100), c = runif(100, 0, 100))
dat3 = data.frame(a = runif(100, 0, 100), b = runif(100, 0, 100), c = runif(100, 0, 100))
dat_list = list(dat1, dat2, dat3)

plot_qq_compare_multi(dat_list, legend_names = c('corrected', 'uncorrected'))

###################################################################################
# Example data for plot_qq_comparison_multi plot example


dat1 = data.frame(a = runif(100, 0, 100), b = runif(100, 0, 100), c = runif(100, 0, 100))

plot_qq_compare(dat1)
