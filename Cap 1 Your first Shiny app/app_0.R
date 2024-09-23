#
#
#

library(shiny)

# User interface (frontend)
ui <- fluidPage(

  selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)

# Behaviour of the app (backend)
server <- function(input, output, session) {

    dataset <- reactive({
      get(input$dataset, "package:datasets")
    })
  
    output$smmary <- renderPrint({
      summary(dataset())
    })
  
    output$table <- renderTable({
      dataset()
    })

}

# Execution
shinyApp(ui = ui, server = server)
