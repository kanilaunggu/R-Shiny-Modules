library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Dashboard R-Lang"),
  dashboardSidebar(),
  dashboardBody(
    #membuat box, 
    box(
        # perintah di bawah menhasilkan html:
        # <div id="correlation_plot" class="shiny-plot-output" style="width: 100% ; height: 400px"></div>
        plotOutput("correlation_plot"),width=8
       )
  )
  
)

server <- function(input,output) {
  # mengambil id correlation_plot dengan bentuk output$correlation_plot
  output$correlation_plot <- renderPlot({
    plot(iris$Sepal.Length,iris$Petal.Length)
  })
}

shinyApp(ui,server)