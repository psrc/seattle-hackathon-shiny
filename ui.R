permit_class_selection <- selectInput("unit_group",
                                     label = "Housing Units",
                                     choices = c("Single-Family",
                                                 "2-9 units",
                                                 "10-20 units",
                                                 "More than 20 units")
                                     )

ui <- fluidPage(
  navbarPage("Is Time to Permitting Equitable in Seattle?",
             theme = bs_theme(base_font = font_google("Poppins")),

             windowTitle = "Seattle Open Data Hackathon",

             tabPanel("The map shows tracts where units of that type were built, colored by the Racial Social Equity Index Value",
                      sidebarLayout(
                        sidebarPanel(permit_class_selection,
                                     source_ui('seattle'),
                                     width = 3),

                        mainPanel(
                          fluidRow(
                            column(width = 6,
                                   card(
                                     plotOutput('plot')
                                     
                                   )
                                   
                            ),
                            column(width = 6,
                                   card(
                                     leafletOutput('map')
                                   )
                            )
                          ), # end fluidRow
                          fluidRow(
                            card(
                            column(width = 9,
                                   DTOutput('table')
                                   )
                            )
                           
                          )
                          
                        )
                        

                      ) # end sidebarLayout

                      )#, # end tabPanel

  )
)