mainpanel_ui <- function(id) {
  ns <- NS(id) 
  
  tagList( 
    mainPanel(
      fluidRow(
        column(width = 6,
               card(
                 echarts4rOutput(ns('plot'))
               )
               
        ),
        column(width = 6,
               card(
                 leafletOutput(ns('map'))
               )
        )
      ) # end fluidRow
      
    )
    
  )
  
}

mainpanel_server <- function(id) {
  moduleServer(id, function(input, output, session) { 
    
    output$plot <- renderEcharts4r({
      
      # placeholder for chart
      iris |> 
        group_by(Species) |> 
        e_charts(Sepal.Length) |> 
        e_line(Sepal.Width) |> 
        e_title("Grouped data")
    })
    
    output$map <- renderLeaflet({
      
      # placeholder for map
      m <- leaflet(data = tract20) %>% 
        addPolygons(weight = 1,
                    fill = FALSE) %>% 
        setView(lng = -122.335167, lat = 47.608013, zoom = 12)
      
      m %>% 
        addProviderTiles(providers$CartoDB.Positron)
      
    })
 
    
    
  }) # end moduleServer
}