library(shiny)

# Paradoja de San Petesburgo
library(ggplot2)
StPetesburgo = function(){
    money = 2
    x = runif(n = 1, min = 0, max = 1)
    
    while(x>=0.5){
        x = runif(n = 1, min = 0, max = 1)
        money = 2*money
    }    
    return(money)
}

experimento = function(n, bank){
    moneyVect = numeric()
    for(x in 1:n){
        moneyVect = c(moneyVect, StPetesburgo())
       
    }
    moneyVect = as.data.frame(table(moneyVect))
    colnames(moneyVect)<-c("Money", "Times")
    return(moneyVect)
}

# Define server logic for random distribution application
shinyServer(function(input, output) {
    

    tabla <- reactive({
        experimento(input$n, input$n_bank)
        
    })
    
    output$plot <- renderPlot({
        plot(tabla())
    })
    
    # Generate a summary of the data
    output$summary <- renderPrint({
    numeros = as.numeric(levels(tabla()$Money))[tabla()$Money]
    number = sum(numeros*tabla()$Times)
    paste("You won",number,"and you paid",input$n_bank*input$n,"final money",number-(input$n_bank*input$n), sep=" ")
    
        
       #times
     
    })
    
    # Generate an HTML table view of the data
    output$table <- renderTable({
        tabla()
    })
    
})
