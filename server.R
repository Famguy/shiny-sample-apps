
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(shiny)
library(lattice)
library(GEOquery)

shinyServer(function(input, output) {
  output$selections <- renderText({
   paste0("You selected GSM", input$gm1," and GSM", input$gm2) 
    
  })
  
  gm1 <- reactive({
    getGEO(paste0('GSM', input$gm1))
  })
  gm2 <- reactive({
    getGEO(paste0('GSM', input$gm2))
  })
  
  output$distPlot <- renderPlot({
    pcaplot(gm1(), gm2())
  })
  
  output$pcatable <- renderTable({
    pcatable(gm1(), gm2())
  })
  

})
