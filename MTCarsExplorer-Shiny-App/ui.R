#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

shinyUI(fluidPage(
  titlePanel("Motor Trend Cars Explorer"),
  sidebarLayout(
    sidebarPanel(
      #sliderInput("sliderMPG", "What is the MPG of the car?", 1, 5, value = 20),
      selectInput("plotType", "Plot Type", c("Box Plot","Scatter Plot","Histogram"), multiple = FALSE, selected = "scatter"),
      selectInput("s1", "Color Scheme", c("Black","Red","Blue","Green"), multiple = FALSE, selected = "Blue"),
      checkboxInput("showTitle", "Show/Hide Plot Title", value = TRUE),
      checkboxInput("showSummv", "Show/Hide Summary", value = TRUE),
      checkboxInput("Instruc", "Show/Hide Instructions", value = TRUE)
    ),
    mainPanel(
      plotOutput("plot1"),
      h4("Summary"),
      textOutput("Summ"),
      h4("Instructions"),
      textOutput("Inst1"),
      textOutput("Inst2"),
      h4(""),
      textOutput("Inst3")
    )
  )
))
