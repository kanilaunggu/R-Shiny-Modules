library(shiny)
library(shinydashboard)
# library Data Tables
library(DT)

ui <- dashboardPage(
  dashboardHeader(title = "Dashboard R-Lang"),
  dashboardSidebar(
    # membuat menu
    sidebarMenu(
      # menu pertama data pohon
      menuItem("Data Iris/Pohon", tabName = "iris", icon = icon("tree")),
      # menu kedua data mobil
      menuItem("Data Cars/Mobil", tabName = "cars", icon = icon("car"))
    )
  ),
  dashboardBody(
    # item Menu
    tabItems(
      # item pertama dari menu pertama tabname="iris"
      tabItem("iris",
  
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
      ),
      # item kedua dari menu kedua tabname="cars"
      tabItem("cars",
         fluidPage(
           h1("Cars"),
           # membuka data cars dalam bentuk datatabe grid
           dataTableOutput("carstable")
         ) 

              
      )
    )
    
    
    

  )
  
)

server <- function(input,output) {
  # mengambil id correlation_plot dengan bentuk output$correlation_plot
  output$correlation_plot <- renderPlot({
    plot(iris$Sepal.Length,iris[[input$features]],
         xlab="Sepal length",ylab = "Feature")
  })
  
  # render data cars carstable
  output$carstable <- renderDataTable(mtcars)
}

shinyApp(ui,server)