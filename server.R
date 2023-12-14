server <- function(input, output, session) {
  
  # mainpanel_server('dummy01',
  #                  housing_unit_group = input$unit_group)

  data <- reactive({
    permit_22_23 %>% 
      filter(housingunitgrp == input$unit_group)
  })
  
  output$table <- renderDT({
    d <- data() %>% 
      select(-geometry)
    
    datatable(d)
  })
  
  output$plot <- renderPlot({
    #input$unit_group
    
    # ggplot(data(), aes(x=housingunitgrp, y=median_time_to_permit, fill=COMPOSITE_QUINTILE)) +
    #   geom_bar(stat = 'identity', position='dodge')
    
    ggplot(data(), aes(x=housingunitgrp_fact, y=median_time_to_permit, fill=COMPOSITE_QUINTILE_fact))+
      geom_bar(stat='identity', position='dodge')
    
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
  
  
  
}