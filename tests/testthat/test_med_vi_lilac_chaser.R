## Load required packages

library(ggplot2)
library(proto)
library(animint)
library(testthat)

context("Test the Lilac Chaser")

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


    ## Testing using testthat
    test_that("data frame is proper", {
        expect_equal(class(df), "data.frame")
    })

    test_that("plots are proper", {
        expect_equal(plots$plot1$layers[[1]]$geom$objname, "point")
        expect_equal(plots$plot1$layers[[2]]$geom$objname, "segment")
        expect_equal(plots$plot1$layers[[3]]$geom$objname, "segment")
    })

    test_that("selected variable is ptn", {
        expect_equal(p1$labels$showSelected, "ptn")
        expect_equal(plots$time$variable, "ptn")
    })

    test_that("transition time difference is as expected", {
        expect_equal(plots$time$ms, 150)
        expect_equal(plots$duration$ptn, 0)
    })

}

vi_lilac_chaser()
