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
        ),
    box(
      #membuat dropdown diberi nama features dan label Features:
      selectInput("features","Features:",
                  #isi dari dropdown
                  c("Sepal.Width","Petal.Length","Petal.Width")),width = 4
    )
  )
  
)

server <- function(input,output) {
  # mengambil id correlation_plot dengan bentuk output$correlation_plot
  output$correlation_plot <- renderPlot({
    plot(iris$Sepal.Length,iris[[input$features]],
         xlab="Sepal length",ylab = "Feature")
  })
}

shinyApp(ui,server)