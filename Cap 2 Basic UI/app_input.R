
library(shiny)

mascotas <- c("Perro", "Gato", "Jerbo", "Pájaro", "Otro", "Mejor ninguna")


# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Types of string input
  textInput("name", "¿Cuál es tu nombre?", value = "Nombre..."),
  passwordInput("password", "¿Cuál es tu password?"),
  textAreaInput("story", "Cuéntame algo de ti", rows = 3),
  
  # Types of numeric input
  numericInput("num", "Primer número", value = 0, min = 0, max = 100),
  sliderInput("num2", "Segundo número", value = 50, min = 0, max = 100),
  sliderInput("rng", "Rango de valores", value = c(10, 20), min = 0, max = 50),

  # Date inputs  
  dateInput("dob", "¿Dónde naciste?",
            format = "dd-mm-yyyy"),
  
  dateRangeInput("holiday", "¿Cuándo piensas tener tus vacaciones?",
                 format = "dd-mm-yyyy",
                 separator = " a "),
  
  sliderInput("rng_fechas", "Fecha tope de entrega", 
              value = c(as.Date("19-09-2024", format("%d-%m-%Y"))), 
              min = as.Date("16-09-2024", format("%d-%m-%Y")), 
              max = as.Date("31-10-2024", format("%d-%m-%Y")),
              timeFormat = "%F"
              ),
  
  # Selectores
  selectInput("state", "¿Cuál es tu estado favorito?", state.name,
              multiple = TRUE),
  selectInput("state", "¿Cuál es tu estado favorito?", 
              list(`Costa Este` = list("NY", "NJ", "CT"),
                   `Costa Oeste` = list("WA", "OR", "CA"),
                   `Interior` = list("MN", "WI", "IA")),
              ),
  
  radioButtons("mascota_r", "¿Cuál es tu mascota favorita", mascotas),
  checkboxGroupInput("mascota_l", "¿Cuál es tu mascota favorita", mascotas),
  checkboxInput("entorno", "¿Estás trabajando? (Marca el check si es así"),

  radioButtons("rb", "Choose one:",
               choiceNames = list(
                 icon("angry"),
                 icon("smile"),
                 icon("sad-tear")
               ),
               choiceValues = list("angry", "happy", "sad")
  ),
  
  # Selección de ficheros
  fileInput("fichero", NULL, 
            buttonLabel = "Seleccione un fichero",
            placeholder = "..."),
  
  # Botones
  actionButton("enviar", "Enviar"),
  actionButton("ayuda", "Actualizar", icon = icon("redo")),
  actionButton("borrar", "Borrar datos", class = "btn-danger"),
  actionButton("enviar_large_green", "Enviar datos", class = "btn-lg btn-success"),
  actionButton("enviar_ancho_total", "Aceptar datos", class = "btn-block")
  
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  }

# Run the application 
shinyApp(ui = ui, server = server)
