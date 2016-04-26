plot_ecdf <- function(dat, legend_names = colnames(dat), title = 'ECDFs', xlab = 'value', ylab = 'probability', out_type = 'display', file_name = 'ecdf-plot', out_dir = getwd()){
  require(ggplot2)
  require(reshape2)

  ecdfs <- list()
  for(i in 1:ncol(dat)){
    ecdfs[[i]] = ecdf(dat[,i])
  }

  ecdf_frames <- list()
  for(i in 1:length(ecdfs)){
    now_dat <- data.frame(dat[,i], ecdfs[[i]](dat[,i]))
    ecdf_frames[[i]] <- now_dat[order(now_dat[,1]),]
  }

  for(i in 1:length(ecdf_frames)){
    colnames(ecdf_frames[[i]]) <- c('x', 'y')
  }

  melter <- data.frame(matrix(ncol = length(ecdf_frames) + 1, nrow = nrow(ecdf_frames[[1]])))
  melter[,1] <- ecdf_frames[[1]][,2]
  
  for(i in 1:length(ecdf_frames)){
    melter[,i+1] <- ecdf_frames[[i]][,1]
  }

  colnames(melter) <- c('X1', legend_names)

  data_long <- melt(melter, id='X1')

  plot_ecdf <- ggplot(data = data_long,
    aes(x = value, y = X1, colour = variable)) +
    labs(title = title, x = xlab, y = ylab) +
    geom_line()
  
  if(out_type == 'display'){
    plot(plot_ecdf)
    print('Printed plot to display device')
  }
  
  if(out_type == 'file'){
    invisible(plot_ecdf, file=paste0(paste(out_dir, file_name, sep = '/'), ".png"), plot=plot_qq)
    print(paste('Saved plot to ', out_dir, sep = ''))
  }
}