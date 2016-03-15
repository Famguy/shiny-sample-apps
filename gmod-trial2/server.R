
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(shiny)
library(ArrayExpress)
library(data.table)

shinyServer(function(input, output) {
  output$selections <- renderText({
   paste0("You selected GSE", input$gse) 
  })
  
  gse <- reactive({
    # clean up
    do.call(file.remove,list(list.files(pattern = ".txt")))
    do.call(file.remove,list(list.files(pattern = ".zip")))
    # get new files
    gs <- getAE(paste0('E-GEOD-', input$gse), type = 'processed')
    files <- list.files(pattern = "_table.txt")
    print(files)
    out <- lapply(files,function(file){
      dt <- fread(file)
      as.vector(dt$VALUE)
    })
    gsmlist <- as.matrix(do.call(rbind,out))
    print("matrix formed")
    #write.table(gsmlist, file=paste0("GSE",input$gse,".data"), sep =',')
    #gsmlist <-read.table("GSE20986.data", sep =',')
    do.call(file.remove,list(list.files(pattern = ".txt")))
    do.call(file.remove,list(list.files(pattern = ".zip")))
    prcomp(gsmlist)
  })
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
  output$distPlot <- renderPlot({
    p <- gse()
    plot(p$x[,1], p$x[,2], col = "blue" , xlab = "PC1", ylab = "PC2")
  })
  
  output$varPlot <- renderPlot({
    g <- gse()
    sd <- g$sdev
    barplot(sd[1:10], xlab = "First Ten Components", ylab = "Variation", xlim = c(0,15), ylim = c(0,max(sd)), col = "blue")
  })
  
})
