library(shiny)
library(shinythemes)

ui <- fluidPage(theme = shinytheme("superhero"),
                titlePanel(""),
                sidebarLayout(
                  sidebarPanel(
                    dateInput("txtDateValue", "Date value (yyyy-MM-dd):", format = "yyyy-mm-dd"),
                    textInput("txtHighValue", "High value:", placeholder = "Enter the value"),
                    textInput("txtLowValue", "Low value:", placeholder = "Enter the value"),
                    textInput("txtCloseValue", "Close value:", placeholder = "Enter the value"),
                    textInput("txtVolumeValue", "Volume value:", placeholder = "Enter the value"),
                    actionButton("Predict", "Predict", class = "btn btn-primary btn-lg btn-block")
                  ),
                  mainPanel(
                    h4("Predict the opening value in the stock market"),
                    hr(),
                    h5("Enter the values and press 'Predict'."),
                    h6(verbatimTextOutput("Result"))
                  )
                ))

server <- function(input, output) {
  calcula <- function() {
    return(1)
  }
  
  observeEvent(input$Predict, {
    result <-
      paste(
        sep = "",
        "The opening value at ",
        input$txtDateValue,
        " is predict to be: ",
        trimws(round(calcula(), digits = 2)),
        "."
      )
    output$Result <- renderText({
      result
    })
  })
}
shinyApp(ui = ui, server = server)
