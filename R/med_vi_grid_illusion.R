## Load required packages

library(ggplot2)
library(animint)
library(proto)


## Function to implement the vi.grid.illusion() function from package 'animation'
vi_grid_illusion <- function(
    nrow = 8, ncol = 8, lwd = 6, cex = 6, col = 'darkgray', type = c('s', 'h')
){

    # Get data in data-frame to pass to ggplot
    x = seq(0, 1, length = ncol)
    y = seq(0, 1, length = nrow)
    df <- data.frame(x = rep(x, times = nrow), y = rep(y, each = ncol))

    dot_color <- "white"  # Color of dots on the grid

    # If type is Hermann grid illusion 'h', hide the dots
    if (type[1] == 'h'){
        dot_color <- col
        cex <- 0
    }

    # Plot to render the illusion
    p1 <- ggplot(data = df) +
        geom_point(aes(x = x, y = y), size = 1, col = dot_color) +
        geom_vline(xintercept = df$x, size = lwd, col = col) +
        geom_hline(yintercept = df$y, size = lwd, col = col) +
        geom_point(aes(x = x, y = y), size = cex, col = dot_color) +
        # Hide the axes, titles and others..
        theme_bw() +
        theme(axis.line=element_blank(),
              axis.text.x=element_blank(), axis.text.y=element_blank(),
              axis.ticks=element_blank(),
              axis.title.x=element_blank(), axis.title.y=element_blank(),
              legend.position="none",
              panel.background=element_rect("black"),panel.border=element_blank(),
              panel.grid.major=element_blank(),panel.grid.minor=element_blank(),
              plot.background=element_rect("black"))

    # Display using animint
    plots <- list(plot1 = p1)
    viz <- animint2dir(plots, out.dir = "vi_grid")
    animint2gist(plot.list = plots,
                 description = "Grid Visual Illusion",
                 browse = TRUE,
                 out.dir = "vi_grid")
}

