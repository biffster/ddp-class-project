library(shiny)
library(UsingR)
countries <- c("Austria", "Belgium", "Bulgaria", "Bulgaria", "Cyprus", "Denmark", "Estonia")

shinyServer(function(input, output) {
  
  # Drop-down selection box for which data set
  output$country <- renderUI({
    # The program is self-documenting, instructions are given to the user below.
    selectInput("pickcountry", "Select a country from the drop-down to show Well-Being and Alcohol Consumption data", as.list(countries))
  })
  

  
  # Output the data
  output$countryOutput <- renderTable({
    # If missing input, return to avoid error later in function
    if(is.null(input$pickcountry))
      return()
    
    # Get the data set
    wellbeingData <- wellbeing
    
    # Keep the selected columns
    wellbeingData <- wellbeingData[wellbeingData$Country==input$pickcountry,c("Country","Well.being","Alcohol.consumption")]
    
    # Return first 20 rows
    head(wellbeingData, 1)
  })
})