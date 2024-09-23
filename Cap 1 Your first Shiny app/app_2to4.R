
library(shiny)

# User interface (frontend)
ui <- fluidPage(
  
  sliderInput("x", label = "If x is ", min = 1, max = 50, value = 30),
  
  sliderInput("y", label = "and y is ", min = 1, max = 50, value = 30),
  
  "then, x times y is", textOutput("product"),
  "and (x * y) + 5 is", textOutput("product_plus5"),
  "and (x * y) + 10 is", textOutput("product_plus10")
)

# Behaviour of the app (backend)
server <- function(input, output, session) {
  
  result <- reactive({input$x * input$y})
  
  output$product <- renderText({
    result()
  })
  
  output$product_plus5 <- renderText({
    result() + 5
  })
  
  output$product_plus10 <- renderText({
    result() + 10
  })
  
}

# Execution
shinyApp(ui = ui, server = server)