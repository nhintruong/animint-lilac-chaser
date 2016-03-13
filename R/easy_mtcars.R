library(ggplot2)
library(animint)

## Load the data
load("./cars_data.Rda")

## Function to plot the graph for the cars_data
draw_viz <- function(){

    # Plotting relevant graphs
    p1 <- ggplot() +
        geom_point(data = cars_data,
                   aes(x = am, y = mpg,
                       clickSelects = Category, colour = Category),
                   size = 3) +
        ggtitle("mpg vs Transmission") +
        xlab("Manual/Automatic") +
        ylab("Miles/Gallon") +
        theme(legend.position = "none")

    p2 <- ggplot() +
        geom_point(data = cars_data,
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
    animint2gist(plot.list = plots,
                 description = "Cars data visualization",
                 browse = TRUE,
                 out.dir = "easy_viz")
}
