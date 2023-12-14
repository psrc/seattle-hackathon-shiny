mainpanel_ui <- function(id) {
  ns <- NS(id) 
  
  tagList( 
    mainPanel(
      fluidRow(
        column(width = 6,
               card(
                 plotOutput(ns('plot'))
                
               )
               
        ),
        column(width = 6,
               card(
                 leafletOutput(ns('map'))
               )
        )
      ), # end fluidRow
      fluidRow(
        DTOutput(ns('table'))
      )
      
    )
    
  )
  
}

mainpanel_server <- function(id, housing_unit_group) {
  moduleServer(id, function(input, output, session) { 
    
    output$table <- renderDT({
      d <- permit_22_23 %>% 
        filter(housingunitgrp == input$unit_group)
      
      datatable(d)
    })
    
    output$plot <- renderPlot({
      #input$unit_group
      
      # # placeholder for chart
      # iris |> 
      #   group_by(Species) |> 
      #   e_charts(Sepal.Length) |> 
      #   e_line(Sepal.Width) |> 
      #   e_title("Placeholder for chart")
    })
    
    output$map <- renderLeaflet({
      
      create_map(lyr = rse_index, 
                 lyr_data_field = rse_index$COMPOSITE_SCORE, 
                 legend_title = 'Racial Social Equity Index', 
                 legend_subtitle='Composite Index Value', 
                 psrc_col_pal = psrc_purples_plus)
      
      # # placeholder for map
      # m <- leaflet(data = ) %>% 
      #   # addPolygons(weight = 1,
      #   #             fill = FALSE) %>% 
      #   setView(lng = -122.335167, lat = 47.608013, zoom = 12)
      # 
      # m %>% 
      #   addProviderTiles(providers$CartoDB.Positron)
      
    })
 
    
    
  }) # end moduleServer
}