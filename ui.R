#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that plots mpg versus other variables
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Miles per Gallon for Cars"),
  
  # Sidebar with inputs
  sidebarLayout(
    sidebarPanel(
      
      selectInput("x", "x-variable", choices = c("horsepower", "weight", "quartersecond", "displacement")),
    
        selectInput("group", "group by", choices = c("cylinders", "forwardgear", "carburetors", "transmission")),
  
    
  hr(),
  helpText("Select which variable and which group for the plot.")),

    # Show the plot
    mainPanel(
       plotOutput("plot")
    ))))
