library(shiny)

# Define UI for random distribution application 
shinyUI(fluidPage(
    
    # Application title
    titlePanel("St Petesburg Paradox"),
    
    # Sidebar with controls to select the random distribution type
    # and number of observations to generate. Note the use of the
    # br() element to introduce extra vertical spacing
    sidebarLayout(
   
        sidebarPanel(     
            helpText("The St. Petersburg paradox is a paradox related to 
                     probability and decision theory in economics. 
                     It is based on a particular (theoretical) lottery game 
                     that leads to a random variable with infinite expected value"),
            sliderInput("n_bank", 
                        "How much the Casino is charging to play", 
                        value = 500,
                        min = 10, 
                        max = 10000),
            helpText("Change the amount of money the bank Charges you to play!"),
            br(),
                    
            sliderInput("n", 
                        "Number of times you'll play", 
                        value = 500,
                        min = 1, 
                        max = 1000),
            helpText("Change how many times you play!!")
        ),
        
        # Show a tabset that includes a plot, summary, and table view
        # of the generated distribution
        mainPanel(
            tabsetPanel(type = "tabs", 
                        tabPanel("Plot", plotOutput("plot")), 
                        tabPanel("Summary", verbatimTextOutput("summary")), 
                        tabPanel("Table", tableOutput("table"))
            )
        )
    )
))
