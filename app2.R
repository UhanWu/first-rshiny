####################################
# Data Professor                   #
# http://youtube.com/dataprofessor #
# http://github.com/dataprofessor  #
####################################

# Modified from https://shiny.rstudio.com/tutorial/written-tutorial/lesson1/

library(shiny)
library(shinythemes)

data(airquality)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  theme = shinytheme("united"),
  
  # App title ----
  titlePanel("Ozone!"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 0,
                  max = 40,
                  value = 20,
                  step = 2)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  

  output$distPlot <- renderPlot({
    
    x    <- airquality$Ozone
    x    <- na.omit(x)
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "black",
         xlab = "Ozone level",
         main = "Histogram of Ozone level")
    
  })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
