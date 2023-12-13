# This module displays a card containing images/hyperlink to data sources

source_ui <- function(id) {
  ns <- NS(id) 
  
  tagList( 
    card(
      card_header("Sources"),
      div(
        a(
          img(src = 'Seattle-logo_horizontal_blue-black_digital_small.png', 
              width = "20%"
              ),
          href = "https://data.seattle.gov/",
          target = "_blank"
          ),
        class = 'text-center'
        ) # end div
    ) # end card
    
  )
  
}