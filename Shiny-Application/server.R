library(shiny)
library(ggplot2)

shinyServer(
    function(input, output, session) {
        DiamondData <- reactive({
            diamonds[, c(input$xvar, input$yvar)]
        })
        
        clusters <- reactive({
            kmeans(DiamondData(), input$k)
        })
        
        output$plot1 <- renderPlot({
            palette(c("#11ACEF","#037A03","#D10D0D","#9A07B7","#FDFD0D"))
            
            par(mar = c(5.1, 4.1, 0, 1))
            plot(DiamondData(),
                 col = clusters()$cluster,
                 pch = 19, cex = 3)
            points(clusters()$centers, pch = 8, cex = 2, lwd =3)
        })
})