library(shiny)
library(ggplot2)

datasets <- c("economics", "faithfuld", "seals")

ui <- fluidPage(
  selectInput("dataset", "Dataset", choices = datasets),
  verbatimTextOutput("summary"),
  plotOutput("plot")
)

server <- function(input, output, session) {
  
  dataset <- reactive({
    get(input$dataset, "package:ggplot2")
  })
  
  output$summary <- renderPrint({
    summary(dataset())
  })
  
  output$plot <- renderPlot({
    
    data <- dataset()
    
    if (is.data.frame(data)) {
      ggplot(dataset(), aes(x = data[[1]], y = data[[2]])) + 
        geom_line() +
        labs(title = paste("Plot of", input$dataset))
        
    } else {
      plot(data)
    }
  }, res = 96)
}

shinyApp(ui = ui, server = server)