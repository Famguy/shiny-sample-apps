
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(googleVis)

shinyUI(fluidPage(

  # Application title
  titlePanel("PCA calculator"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      helpText("This is a tool to do Principal Component Analysis on a particular GSE"),
      helpText("Some sample GSE ids: 21653, 20986"),
      numericInput("gse", label = h4("GSE ID of first sample"), value = 20986)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      textOutput("selections"),
      tabsetPanel(
        tabPanel("PCA plot", plotOutput("distPlot")),
        tabPanel("Variation in PCA", plotOutput("varPlot"))
      ),
      tags$head(tags$style(type="text/css", "
             #loadmessage {
               position: fixed;
               top: 0px;
               left: 0px;
               width: 100%;
               padding: 5px 0px 5px 0px;
               text-align: center;
               font-weight: bold;
               font-size: 100%;
               color: #000000;
               background-color: #CCFF66;
               z-index: 105;
             }
          ")),
      conditionalPanel(condition="$('html').hasClass('shiny-busy')",
                       tags$div("Loading...",id="loadmessage"))
    )
  )
  
  
))
