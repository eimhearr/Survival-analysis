#server German Breast cancer study
#author: EimheaR Rainey


library(shiny)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {

    # 
    df  <- read.delim("survival.txt")
    updateSelectizeInput(session = session, inputId = "colnames", label = "Variable",
                         choices = colnames(df), selected = "Age", server = TRUE)

    x <- reactive({
        df[, input$colnames]
    })
    
 
    output$distPlot <- renderPlotly({

     

        # draw the histogram with the specified number of bins
        plot_ly(x = x(), nbinsx = as.numeric(input$var), type = "histogram", color = "reds")

    })

})
