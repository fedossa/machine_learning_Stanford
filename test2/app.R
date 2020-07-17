shinyUI(pageWithSidebar(
    
    
    headerPanel("Title"),
    
    sidebarPanel(
        sliderInput(inputId = "opt.cex",
                    label = "Point Size (cex)",                            
                    min = 0, max = 2, step = 0.25, value = 1),
        sliderInput(inputId = "opt.cexaxis",
                    label = "Axis Text Size (cex.axis)",                            
                    min = 0, max = 2, step = 0.25, value = 1) 
    ),
    
    mainPanel(
        plotOutput(outputId = "main_plot",  width = "100%"),
        plotOutput(outputId = "main_plot2", width = "100%")
    )
))


###Server.R
shinyServer(function(input, output) {
    
    
    x <- 1:10
    y <- x^2
    
    output$main_plot <- renderPlot({    
        plot(x, y)}, height = 200, width = 300)
    
    
    output$main_plot2 <- renderPlot({
        plot(x, y, cex=input$opt.cex, cex.lab=input$opt.cexaxis) }, height = 400, width = 600 )
} )