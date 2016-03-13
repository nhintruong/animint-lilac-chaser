library(ggplot2)
library(animint)
library(testthat)

# Load the data
load("../../mtcars_edit.Rda")
context("Test the mtcars Visualization")

draw_viz <- function(){

    # Plotting relevant graphs
    p1 <- ggplot() +
        geom_point(data = mtcars,
                   aes(x = am, y = mpg,
                       clickSelects = Category, colour = Category),
                   size = 3) +
        ggtitle("mpg vs Transmission") +
        xlab("Manual/Automatic") +
        ylab("Miles/Gallon") +
        theme(legend.position = "none")

    p2 <- ggplot() +
        geom_point(data = mtcars,
                   aes(x = mpg, y = hp,
                       showSelected = Category, colour = Category),
                   size = 3.5) +
        ggtitle("HP vs mpg for selected Category") +
        xlab("Miles/Gallon") +
        ylab("Horsepower")

    # Render using animint
    plots <- list(plot1 = p1, plot2 = p2)
    plots$time <- list(variable = "Category", ms = 3000)
    plots$duration <- list(Category=1000)


    animint2dir(plot.list = plots, out.dir = "easy_viz")

    ## Tests for visualizations
    test_that("plots are proper", {
        expect_identical(p1$layers[[1]]$geom$objname, "point")
        expect_identical(p2$layers[[1]]$geom$objname, "point")
    })

    test_that("labels are displayed properly", {
        expect_equal(p1$labels$title, "mpg vs Transmission")
        expect_equal(p1$labels$x, "Manual/Automatic")
        expect_equal(p1$labels$y, "Miles/Gallon")
        expect_equal(p1$theme$legend.position, "none")

        expect_equal(p2$labels$title, "HP vs mpg for selected Category")
        expect_equal(p2$labels$x, "Miles/Gallon")
        expect_equal(p2$labels$y, "Horsepower")
    })

    test_that("size of points is proper", {
        expect_equal(p1$layers[[1]]$geom_params$size, 3)
        expect_equal(p2$layers[[1]]$geom_params$size, 3.5)
    })

    test_that("selected variable is Category", {
        expect_equal(p1$labels$clickSelects, "Category")
        expect_equal(p1$labels$colour, "Category")
        expect_equal(p2$labels$showSelected, "Category")
        expect_equal(p2$labels$colour, "Category")
        expect_equal(plots$time$variable, "Category")
    })

    test_that("transition time difference is as expected",{
        expect_equal(plots$time$ms, 3000)
        expect_equal(plots$duration$Category, 1000)
    })

}

draw_viz()
