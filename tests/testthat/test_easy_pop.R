library(ggplot2)
library(animint)
library(testthat)

load(file = "../../plot_data.Rda")
context("Test the Population Visualization")

plot_data <- function(){
    p1 <- ggplot() +
        geom_bar(data = country_data,
                 aes(x = Name, y = pop_growth, fill = Code,
                     clickSelects = Code, showSelected = Year),
                 colour = "black",
                 stat = "identity", position = "identity") +
        theme(legend.position = "none") +
        ggtitle("Comparing Population Growth (%)") +
        xlab("Country") +
        ylab("Population Growth (%)") +
        theme(axis.title.x = element_text(face="bold", colour="#990000", size=30),
              axis.text.x  = element_text(angle=75))
    
    p2 <- ggplot() +
        make_tallrect(country_data, "Year", alpha = 0.30, colour = "gray") +
        geom_point(data = country_data,
                   aes(x=Year, y=pop_growth, colour = Code,
                       clickSelects = Year, showSelected = Code),
                   size = 4) +
        geom_line(data = country_data,
                  aes(x=Year, y=pop_growth, colour = Code,
                      showSelected = Code)) +
        theme_classic() +
        ggtitle("Population Growth (%) over Time") +
        xlab("Year") +
        ylab("Population Growth (%)")
    
    plots <- list(p1 = p1, p2 = p2)
    plots$time <- list(variable = "Year", ms = 3000)
    plots$duration <- list(Year = 500)
    return(plots)
}

plots <- plot_data()
animint2dir(plots, out.dir = "easy_viz", open.browser = FALSE)

## Tests for visualizations
test_that("plots are proper", {
    expect_identical(plots$p1$layers[[1]]$geom$objname, "bar")
    expect_identical(plots$p2$layers[[1]]$geom$objname, "tallrect")
    expect_identical(plots$p2$layers[[2]]$geom$objname, "point")
    expect_identical(plots$p2$layers[[3]]$geom$objname, "line")
})


test_that("size of points is proper", {
    expect_equal(plots$p2$layers[[2]]$geom_params$size, 4)
})

test_that("selected variable is proper", {
    expect_equal(plots$p1$labels$clickSelects, "Code")
    expect_equal(plots$p1$labels$showSelected, "Year")
    expect_equal(plots$p1$labels$fill, "Code")
    expect_equal(plots$p2$labels$showSelected, "Code")
    expect_equal(plots$p2$labels$colour, "Code")
    expect_equal(plots$time$variable, "Year")
})

test_that("transition time difference is as expected",{
    expect_equal(plots$time$ms, 3000)
    expect_equal(plots$duration$Year, 500)
})