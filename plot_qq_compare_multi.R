plot_qq_compare_multi <- function(dat_list, legend_names = colnames(dat_list[[1]])[2:length(colnames(dat_list[[1]]))], title = 'QQ Comparison', xlab = 'Base Variable' , ylab = 'Compare Variable', output_type = 'display', out_dir = getwd()){
  
  require(ggplot2)
  require(reshape2)
  require(Rmisc)
  
  sorts <- dat_list
  melter <- list()
  dat_long <- list()
  
  norm_vec <- function(v) (v - min(v))/diff(range(v))
  
  for(j in 1:length(dat_list)){
    for(i in 1:ncol(dat_list[[j]])){
      sorts[[j]][,i] <- sort(dat_list[[j]][,i])
    }
  } 
  
  melter <- list()
  lister <- data.frame(matrix( ncol = length(dat_list), nrow = nrow(dat_list[[1]])))
  for(i in 1:ncol(dat_list[[1]])){
    melter[[i]] <- lister
  }
  
  
  for(i in 1:ncol(dat_list[[1]])){
    for(j in 1:length(dat_list)){
      melter[[i]][,j] <- data.frame(sorts[[j]][,i])
    }
    colnames(melter[[i]]) <- c('observed', legend_names)
  }
  
  long <- list()
  
  for(i in 1:length(melter)){
    long[[i]] <- melt(melter[[i]], id = 'observed')
  }
  
  plots <- list()
  for(i in 1:length(long)){
    plots[[i]] <- ggplot(data = long[[i]]) +
      aes(x = observed, y = value,  color = long[[i]]$variable) +
      labs(title = title, x = xlab, y = ylab, color = '') +
      geom_point(size=4, alpha=1) +
      geom_abline(slope=1, intercept=0) 
    
  }
  
  plot_num <- length(plots)
  if(length(plots) %% 2 == 1){
    plot_num = length(plots) + 1
  }
  
  grid_cols <- plot_num/2
  
  if(output_type == 'display'){
    multiplot(plotlist=plots,cols = grid_cols)
    print('Printed plots to display device')
  }
  
  if(output_type == 'file'){
    labs = as.character(seq(1, length(plots), 1))
    invisible(mapply(ggsave, file=paste0(paste(out_dir, "plot-", sep = '/'), labs, ".png"), plot=plots))
    print(paste('Saved plots to ', out_dir, sep = ''))
  }
  
}