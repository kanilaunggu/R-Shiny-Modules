library(shiny)
library(shinydashboard)

ui <- dashboardPage(
      dashboardHeader(title = "Dashboard R-Lang"),
      dashboardSidebar(),
      dashboardBody()
  
)

server <- function(input,output) {
  
}

shinyApp(ui,server)