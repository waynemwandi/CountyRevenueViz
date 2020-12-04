
# Shiny dashboard is a framework
library(shiny)
library(shinydashboard)

# Global Variables
county <- unique(sort(countyrevenue$County))

ui <- dashboardPage(
  dashboardHeader(title = "County Revenue Data Dashboard",
                  titleWidth = 325),
  dashboardSidebar(width = 220,
    selectInput(inputId = "County", label = "Select County", choices = county, selected = "Baringo")
    ),
  
  dashboardBody(
    # Visualisations can go row-wise or column-wise
    # These visualisations will be stored in boxes
    fluidRow(
      box(width = 12, plotOutput("TargetandTotal", height = 450))
    )
  )
)

server <- function(input, output) { 
  
  # Function to filter
  filtered_data <- reactive({
    nwk %>%
      filter(
        county %in% input$County,
      )
  })
  
  # Function to render plotOutput
  output$TargetandTotal <- renderPlot({
    filter(countyrevenue, County %in% input$County) %>%
      ggplot(aes(x=Year, y = TotalRevenue)) + 
      geom_line() +
      labs(y = "Revenue in Billions",subtitle = "Total Revenue from 2014- 2018") +
      theme_linedraw()
  })
  

  }

shinyApp(ui, server)