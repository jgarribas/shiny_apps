#
#
#

library(shiny)

# User interface (frontend)
ui <- fluidPage(

  textInput("name", "What's your name?"),
  tableOutput("greeting")
)

# Behaviour of the app (backend)
server <- function(input, output, session) {

  output$greeting <- renderText({
    paste0("Hello ", input$name)
  })

}

# Execution
shinyApp(ui = ui, server = server)
