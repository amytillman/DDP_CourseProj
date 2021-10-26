#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#

library(shiny)
library(tidyverse)
library(RColorBrewer)
library(patchwork)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$scatterPlot <- renderPlot({

        #dataset
        data("diamonds")
        
        #min and max based on input$slider from ui.R
        maxPrice=input$slider[2]
        minPrice=input$slider[1]
        
        #subset data based on min and max price
        diamonds2 <- diamonds %>% filter(price<=maxPrice & price>=minPrice)
        
        # draw three different scatterplots to display 
        # price vs. carat for color, cut, and clarity
        
        p1 <- ggplot(data=diamonds2, aes(x=carat,y=price)) +
            geom_point(aes(colour=color),alpha=0.4) +
            labs(x="Carat",y="Price (USD)") +
            theme(legend.title=element_text(size=10), 
                  legend.text=element_text(size=8),
                  legend.position="right",
                  legend.key=element_rect(fill="white")) +
            guides(color=guide_legend(ncol=2, byrow=FALSE)) +
            scale_color_brewer(palette="Paired")
        p2 <- ggplot(data=diamonds2, aes(x=carat,y=price)) +
            geom_point(aes(colour=cut),alpha=0.4) +
            labs(x="Carat",y="Price (USD)") +
            theme(legend.title=element_text(size=10), 
                  legend.text=element_text(size=8),
                  legend.position="right",
                  legend.key=element_rect(fill="white")) +
            guides(color=guide_legend(ncol=1, byrow=FALSE)) +
            scale_color_brewer(palette="Paired")
        p3 <- ggplot(data=diamonds2, aes(x=carat,y=price)) +
            geom_point(aes(colour=clarity),alpha=0.4) +
            labs(x="Carat",y="Price (USD)") +
            theme(legend.title=element_text(size=10), 
                  legend.text=element_text(size=8),        
                  legend.position="right",
                  legend.key=element_rect(fill="white")) +
            guides(color=guide_legend(ncol=2, byrow=FALSE)) +
            scale_color_brewer(palette="Paired")
        
        p1 / p2 / p3
        
    })

})
