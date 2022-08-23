library(shiny)
library(shinythemes)

regression_data = read.csv("../data/raw/slr12.csv", sep = ";")

# A linear model is sufficient for the required simple univariate regression.
model = lm(InitialCost ~ FranchiseAnnualCost, data = regression_data)

# Define UI for application.
ui = fluidPage(
    theme = shinytheme("yeti"),

    # Application title.
    titlePanel(h1(align = "center", "Franchise Starting Cost Prediction with
                  Regression Model"),
               windowTitle = "Franchise Starting Cost Prediction with
                  Regression Model"),

    fluidRow(
        # We show a table having the first 10 values from the input data to
        # readily provide to the user a summary on the available data.
        column(4, align = "center",
               h2("Data"),
               tableOutput("dataTableID")),
        column(8, align = "center",
               plotOutput("regressionGraphID"))
    ),
    fluidRow(
        column(4, align = "center",
               h2("Franchise annual cost"),
               
               # Hint is set as 1500 because it is a reasonable value for the
               # example dataset.
               numericInput("newValueID", "Insert annual cost: ", value = 1500,
                            min = 1),
               actionButton("buttonID", "Run Prediction")
        ),
        column(8, align = "center",
               h2(textOutput("resultTextID")))
    )

)

# Define server logic.
server = function(input, output) {
    # Scatter plot the data and draw regression line across the plot.
    output$regressionGraphID = renderPlot({
        plot(InitialCost ~ FranchiseAnnualCost, data = regression_data)
        abline(model)
    })
    
    # Only the first 10 values are shown as the intent here is just to provide
    # a quick summary on the used data.
    output$dataTableID = renderTable({
        head(regression_data, 10)
    })
    
    # When button "Predict!" is clicked, calculate and show the predicted cost.
    observeEvent(input$buttonID, {
        value_regression = input$newValueID
        prediction = predict(
            model,
            data.frame(FranchiseAnnualCost = eval(parse(text = value_regression)))
        )
        prediction = paste0("Predicted initial cost: ", round(prediction, 2), "$")
        output$resultTextID = renderText({
            prediction
        })
    })
}

# Run the application.
shinyApp(ui = ui, server = server)
