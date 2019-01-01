#sessionInfo()
library(shiny)
library(shinydashboard)

# ui <- dashboardPage(
#   dashboardHeader(),
#   dashboardSidebar(
#     selectInput("variable", "Variable:",
#                 c("Cylinders" = "cyl",
#                   "Transmission" = "am",
#                   "Gears" = "gear"))
#   ),
#   dashboardBody(
#     textOutput("selected_var")
#   )
# )
# server <- function(input, output) { 
#   output$selected_var <-  output$selected_var <- renderText({
#     print(input$variable)
#     paste("You have selected", input$variable)
#   }) 
# }
# 
# shinyApp(ui, server)


#UI modules
SelInputUI <- function(id, label = "Variable:") {
  # Create a namespace function using the provided id
  ns <- NS(id)
  tagList(
    selectInput(ns("variable"), label,
                c("Cylinders" = "cyl",
                  "Transmission" = "am",
                  "Gears" = "gear"))
  )
}

#Server modules
SelInput <- function(input, output, session) {
  
  cho <- reactive({
    input$variable
  })
  
  #print(paste("server:",cho()))
  
  return(cho)
}

ui <- dashboardPage(
  dashboardHeader(title ="Example::Modules"),
  dashboardSidebar(
    SelInputUI("nsid", label = "Select Variable")
  ),
  dashboardBody(
    textOutput("selected_var")
  )
)
server <- function(input, output, session) { 
  sss <-callModule(SelInput,"nsid")
  
  output$selected_var <- renderText({
    print(sss())
    paste("You have selected", sss())
  }) 
}

shinyApp(ui, server)


