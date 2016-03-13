## Load required packages

library(ggplot2)
library(proto)
library(animint)

## Function to implement the vi.lilac.chaser() function from package 'animation'
vi_lilac_chaser <- function(np = 10,
                            nmax = 1,
                            col = 'magenta',
                            p.size = 20,
                            c.size = 4
)
{
    x <- seq(0, 2 * pi * np/(np + 1), length = np)  # Get co-ordinates to plot

    # Get data in a data-frame to pass to ggplot
    df <- data.frame()
    for (i in 1:np) {
        df <- rbind(df, cbind(sin(x[-i]), cos(x[-i]), ptn = i))}
    colnames(df) <- c("sinv", "cosv", "ptn")


    # Plot to display the points and the '+' mark in the middle
    p1 <- ggplot(data = df) +
        # Display the points
        geom_point(data = df,
                   aes(x = sinv, y = cosv, showSelected = ptn),
                   col = col,
                   size = p.size) +
        # Display the '+' mark
        geom_segment(aes(x=-0.1, y=0, xend=0.1, yend=0), size=c.size) +
        geom_segment(aes(x=0, y=-0.1, xend=0, yend=0.1), size=c.size) +
        xlim(c(-1.33, 1.33)) +
        ylim(c(-1.33, 1.33)) +
        # Hide the axes, titles and others..
        theme_bw() +
        theme(axis.line=element_blank(),
              axis.text.x=element_blank(), axis.text.y=element_blank(),
              axis.ticks=element_blank(),
              axis.title.x=element_blank(), axis.title.y=element_blank(),
              legend.position="none",
              panel.background=element_blank(),panel.border=element_blank(),
              panel.grid.major=element_blank(),panel.grid.minor=element_blank(),
              plot.background=element_blank())


    # Automate using animint taking point number 'ptn' as variable
    plots <- list(plot1 = p1)
    plots$time <- list(variable = "ptn", ms = 150)
    plots$duration <- list(ptn=0)
    animint2dir(plots, out.dir = "vi_lilac")

    invisible(NULL)
}
