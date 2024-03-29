library(httr)
library(jsonlite)
library(shiny)
library(keyring)
library(rjson)
library(leaflet)
#source('global.R')


r_colors <- rgb(t(col2rgb(colors()) / 255))
names(r_colors) <- colors()


  
ui <- fluidPage(
  theme = "bootstrap.min.css",
  htmlTemplate("www/index.html")
)


server <- function(input, output, session) {
  
  points <- eventReactive(input$recalc, {
    cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)
  }, ignoreNULL = FALSE)
  
  output$mymap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles(providers$Stamen.TonerLite,
                       options = providerTileOptions(noWrap = TRUE)
      ) %>%
      addMarkers(data = points())
  })
}

shinyApp(ui, server)
