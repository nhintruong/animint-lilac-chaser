library(ggplot2)
library(animint)

## Load the data
load(file = "./../plot_data.Rda")

plot_data <- function(){
    # Plot the bar graph with option to select country
    p1 <- ggplot() +
        # Plot bar graph to show growth of each country
        geom_bar(data = country_data,
                 aes(x = Name, y = pop_growth, fill = Code,
                     clickSelects = Code, showSelected = Year),
                 colour = "black",
                 stat = "identity", position = "identity") +
        theme(legend.position = "none") +
        ggtitle("Comparing Population Growth (%)") +
        xlab("Country") +
        ylab("Population Growth (%)") +
        # Tilt text in X axis
        theme(axis.text.x  = element_text(angle=75))

    p2 <- ggplot() +
        # Tall rect to select year
        make_tallrect(country_data, "Year", alpha = 0.30, colour = "gray") +
        # Plot points showing yearly growth
        geom_point(data = country_data,
                   aes(x=Year, y=pop_growth, colour = Code,
                       clickSelects = Year, showSelected = Code),
                   size = 4) +
        # Plot line between points
        geom_line(data = country_data,
                  aes(x=Year, y=pop_growth, colour = Code,
                      showSelected = Code)) +
        theme_classic() +
        ggtitle("Population Growth (%) over Time") +
        xlab("Year") +
        ylab("Population Growth (%)")

    plots <- list(plot1 = p1, plot2 = p2)
    plots$time <- list(variable = "Year", ms = 3000)
    plots$duration <- list(Year = 500)
    return(plots)
}

plots <- plot_data()
animint2dir(plots, out.dir = "easy_viz", open.browser = T)
animint2gist(plot.list = plots,
             description = "Country Population Growth Visualization",
             out.dir = "easy_viz",
             browse = TRUE)
