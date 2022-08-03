library(shiny)
library(shinythemes)

regression_data = read.csv("../data/raw/slr12.csv", sep = ";")
model = lm(InitialCost ~ FranchiseAnnualCost, data = regression_data)

# Define UI for application
ui = fluidPage(
    theme = shinytheme("yeti"),

    # Application title
    titlePanel("New Franchise Initial Cost Prediction with Regression Model"),

    fluidRow(
        column(4, h2("Data"), tableOutput("dataTableID")),
        column(8, plotOutput("regressionGraphID"))
    ),
    fluidRow(
        column(6, h2("Franchise annual cost"),
               numericInput("newValueID", "Insert annual cost: ", 1500, min = 1, max = 9999999),
               actionButton("buttonID", "Run Prediction")
        ),
        column(6, h2(textOutput("resultTextID")))
    )

)

# Define server logic
server = function(input, output) {
    output$regressionGraphID = renderPlot({
        plot(InitialCost ~ FranchiseAnnualCost, data = regression_data)
        abline(model)
    })
    
    output$dataTableID = renderTable({
        head(regression_data, 10)
    })
    
    observeEvent(input$buttonID, {
        value_regression = input$newValueID
        prev = predict(model, data.frame(FranchiseAnnualCost = eval(parse(text = value_regression))))
        prev = paste0("Predicted initial cost: ", round(prev, 2), "$")
        output$resultTextID = renderText({prev})
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
