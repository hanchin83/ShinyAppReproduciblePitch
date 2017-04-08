#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

data(mtcars)
index <- c(2,3,4,6,7,9,10,11)
colNames <- c("cylinders", "displacement", "horsepower", "weight", "quartersecond", "transmission", "forwardgear", "carburetors")
names(mtcars)[index] <- colNames
mtcars$cylinders <- as.factor(mtcars$cylinders)
mtcars$transmission <- as.factor(mtcars$transmission)
mtcars$forwardgear <- as.factor(mtcars$forwardgear)
mtcars$carburetors <- as.factor(mtcars$carburetors)

# Define server logic required to draw a plot of mpg versus other variables
shinyServer(function(input, output) {
   
  output$plot <- renderPlot({
    
    g <- ggplot(mtcars, aes(y = mtcars$mpg)) + geom_point(aes_string(x=input$x, col = input$group), size = 3)  
    g + labs(title = "MPG versus other variables", y = "MPG") + theme(plot.title = element_text(hjust = 0.5))
    
  })
  
})
