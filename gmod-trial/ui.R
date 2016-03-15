
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("PCA calculator"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      helpText("This is a tool to do Principal Component Analysis on two GEO Samples based on their GSM ids"),
      helpText("Some sample GSM ids: "),
      helpText("1570843 - 1571051 (For Gene expression data from 209 ependymal tumor samples - GSE64415)"),
      numericInput("gm1", label = h4("GSM ID of first sample"), value = 1570843),
      numericInput("gm2", label = h4("GSM ID of second sample"), value = 1570844)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      textOutput("selections"),
      tabsetPanel(
        tabPanel("Data", tableOutput("pcatable")),
        tabPanel("PCA plot", plotOutput("distPlot"))
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
