plot_qq_compare <- function(dat1, out_type = 'display', color_ramp = c('green', 'orange', 'red'), title = 'QQ Comparison', xlab = 'Base Variable', ylab = 'Comapre Variable', file_name = 'qq-test' ){
  
  require(gridExtra)
  require(ggplot2)
  
  norm_vec <- function(v) (v - min(v))/diff(range(v))
  
  q1 <- list()
  for(i in 1:ncol(dat1)){
    q1[[i]] <-sort(dat1[,i])
  }
  
  datin <- data.frame(x1 = q1[[1]], x2 = q1[[2]])
  test <- seq(1, length(q1), by = 1)
  
  cost <- abs(datin[,2] - datin[,1])
  col_ramp <- colorRampPalette(color_ramp)(100)
  
  col_by_cost <- col_ramp[ceiling(norm_vec(cost)*99)+1]
  
  plot_qq <- ggplot(data = datin) +
    aes(x = datin[,1], y = datin[,2]) +
    labs(title = title, x = xlab, y = ylab) +
    geom_point(size=4, alpha=1, color = col_by_cost) +
    geom_abline(slope=1, intercept=0) 
  
  if(out_type == 'display'){
    plot(plot_qq)
    print('Printed plots to display device')
  }
  
  if(out_type == 'file'){
    invisible(plot_qq, file=paste0(paste(out_dir, file_name, sep = '/'), ".png"), plot=plot_qq)
    print(paste('Saved plot to ', out_dir, sep = ''))
  }
  
}