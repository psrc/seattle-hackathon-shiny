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
    psrc_purples_plus <- append(psrc_colors$purples_inc, c("#FFFFFF"), after=0)

    ggplot(data(), aes(x=housingunitgrp_fact, y=median_time_to_permit, fill=COMPOSITE_QUINTILE_fact))+
      geom_bar(stat='identity', position='dodge') +
      labs(x="Housing Unit Group", y="Median Time to Permit(days)") + 
      scale_fill_manual(name = "Racial Social Equity Priority", values=psrc_purples_plus)
    
  })
  
  output$map <- renderLeaflet({
    
    m <- permit_22_23_map %>% 
      filter(housingunitgrp == input$unit_group)
    
    create_map(lyr = m, 
               lyr_data_field = m$COMPOSITE_QUINTILE_fact,
               n_data_field = m$n_permit_issued,
               legend_title = 'Racial Social Equity Priority', 
               legend_subtitle='where permits granted', 
               psrc_col_pal = psrc_purples_plus)
    
  })
  
  
  
}