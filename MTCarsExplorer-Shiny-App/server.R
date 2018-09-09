#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {

  output$plot1 <- renderPlot({
    mpgInput <- input$sliderMPG
    
    if(input$plotType == "Scatter Plot"){
      if(input$showTitle){
        titlev <- "Weight vs mpg Distribution"
      } 
      else{
        titlev <- ""
      }
      if(input$s1 == "Black"){colov <- "white" }
      else if(input$s1 == "Red"){colov <- "red" }
      else if(input$s1 == "Blue"){colov <- "blue" }
      else if(input$s1 == "Green"){colov <- "green" }
        ggplot(mtcars, aes(x=wt, y=mpg, colour=cyl)) +
        geom_point(size=6) + scale_colour_gradient(low = colov, high = "black") + 
        ggtitle(titlev) +
        theme(plot.title = element_text(face="bold", size=20)) +
        theme(axis.title = element_text(size=14)) 
    }
    else if(input$plotType == "Box Plot"){
      if(input$showTitle){
        titlev <- "Mileage Data"
      } 
      else{
        titlev <- ""
      }
      if(input$s1 == "Black"){colov <- c("gray69","gray98","gray31") }
      else if(input$s1 == "Red"){colov <- c("indianred3","tan3","coral") }
      else if(input$s1 == "Blue"){colov <- c("steelblue3","royalblue4","lightblue1") }
      else if(input$s1 == "Green"){colov <- c("steelblue3","royalblue4","lightblue1") }
      boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders",
              ylab = "Miles Per Gallon", main = titlev,
              col = colov)
    }
    else if(input$plotType == "Histogram"){
      if(input$showTitle){
        titlev <- "Mortor Vehicle Class Distribution by Displacement"
      } 
      else{
        titlev <- ""
      }
      if(input$s1 == "Black"){colov <- "Greys" }
      else if(input$s1 == "Red"){colov <- "Reds" }
      else if(input$s1 == "Blue"){colov <- "Blues" }
      else if(input$s1 == "Green"){colov <- "Greens" }
        ggplot(data=mpg, aes(x=class, y=displ, fill=drv)) +
        geom_bar(stat = "identity") + scale_fill_brewer(palette = colov) +
        ggtitle(titlev) +
        theme(plot.title = element_text(face="bold", size=20)) +
        theme(axis.title = element_text(size=14)) 
    }
    
  })
  output$Summ <- renderText({
    if(input$showSummv){
      "The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models). This app provides multiple ways for you to visualize relationship between horsepower, engine displacement, number of cylinders for different car models"
    }
  })
  output$Inst1 <- renderText({
    if(input$Instruc){
      "1. Select a plot type you want to view for the mtcars dataset."
    }
  })
  output$Inst2 <- renderText({
    if(input$Instruc){
      "2. Select your color prefrence for the plot."
    }
  })
  output$Inst3 <- renderText({
    if(input$Instruc){
      "Application Presentation can be accessed: http://rpubs.com/eabbey/mtcarsexp"
    }
  })
})