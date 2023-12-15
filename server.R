server <- function(input, output, session) {

  data <- reactive({
    permit_22_23_2 %>% 
      filter(housingunitgrp == input$unit_group)
  })
  
  output$table <- renderDT({
    d <- data()
    
    datatable(d)
  })
  
  output$plot <- renderPlot({

    ggplot(data(), aes(x=housingunitgrp_fact, y=median_time_to_permit, fill=COMPOSITE_QUINTILE_fact))+
      geom_bar(stat='identity', position='dodge') +
      labs(x="Housing Unit Group", y="Median Time to Permit") + 
      scale_fill_discrete(name = "Composite RSE Index")
    
  })
  
  output$map <- renderLeaflet({
    
    m <- permit_22_23_map %>% 
      filter(housingunitgrp == input$unit_group)
    
    create_map(lyr = m, 
               lyr_data_field = rse_index$COMPOSITE_SCORE, 
               legend_title = 'Racial Social Equity Index', 
               legend_subtitle='Composite Index Value', 
               psrc_col_pal = psrc_purples_plus)
    
  })
  
  
  
}