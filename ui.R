permit_class_selection <- selectInput("unit_group",
                                     label = "Housing Units",
                                     choices = c("Single-Family",
                                                 "2-9 units",
                                                 "10-20 units",
                                                 "More than 20 units")
                                     )

ui <- fluidPage(
  navbarPage("Seattle Open Data Hackathon",
             theme = bs_theme(base_font = font_google("Poppins")),
             # useShinyjs(),

             windowTitle = "Seattle Open Data Hackathon",

             tabPanel("Building Permits",
                      sidebarLayout(
                        sidebarPanel(permit_class_selection,
                                     source_ui('seattle'),
                                     width = 3),
                        # mainpanel_ui('dummy01')
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
                            column(width = 12,
                                   DTOutput('table')
                                   )
                           
                          )
                          
                        )
                        

                      ) # end sidebarLayout

                      )#, # end tabPanel

  )
)