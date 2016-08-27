shinyUI(pageWithSidebar(
  
  headerPanel(""),
  
  sidebarPanel(
    uiOutput("country")),
    
  mainPanel(
    tableOutput("countryOutput")
  )
))