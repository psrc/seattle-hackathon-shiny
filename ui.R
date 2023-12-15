permit_class_selection <- selectInput("unit_group",
                                     label = "Housing Units",
                                     choices = c("Single-Family",
                                                 "2-9 units",
                                                 "10-20 units",
                                                 "More than 20 units")
                                     )

ui <- fluidPage(
  navbarPage("Housing Permits(2022-2023) by Equity Priority Area ",
             theme = bs_theme(base_font = font_google("Poppins")),

             windowTitle = "Seattle Open Data Hackathon",

             tabPanel("The map shows tracts where units of that type were permitted in 2022-23, colored by the Racial Social Equity Index Value",
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