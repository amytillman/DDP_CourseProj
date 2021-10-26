#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("DDP Course Project - Diamond Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h4("Documentation:"),
            h6("1. Pick the desired dimaond price range in US dollars (minimum and maximum)."),
            h6("2. Press the 'Submit' button to see the revised scatterplots."),
            sliderInput("slider",
                        "Pick Desired Minimum and Maximum Diamond Price (USD):",
                        min = 326,
                        max = 18823,
                        value = c(1000,10000)),
            submitButton("Submit")
        ),

        # Show three plots given the desired price range
        mainPanel(
            h4("Scatterplots of price vs. carat for diamond color, cut, and clarity:"),
            plotOutput("scatterPlot")
        )
    )
))
