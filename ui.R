permit_class_selection <- selectInput("unit_group",
                                     label = "Housing Units",
                                     choices = c("Single-Family",
                                                 "2-9 units",
                                                 "10-20 units",
                                                 "More than 20 units")
                                     )

ui <- fluidPage(
  navbarPage("Housing Permit Time by Racial Social Equity",
             theme = bs_theme(base_font = font_google("Poppins")),

             windowTitle = "Seattle Open Data Hackathon",

             tabPanel("The map shows tracts where units of that type were permitted in 2022-23, colored by the Racial Social Equity Index Value",
                      sidebarLayout(
                        sidebarPanel(permit_class_selection,
                                     source_ui('seattle'),
                                     width = 4),

                        mainPanel(
                          fluidRow(
                            column(width = 10,
                                   card(
                                     plotOutput('plot')
                                   )
                            ),
                            column(width = 12,
                                   card(
                                     leafletOutput('map')
                                   )
                            )
                          ), # end fluidRow
                          fluidRow(
                            card(
                            column(width = 12,
                                   DTOutput('table')
                                   )
                            )
                          )
                        )
                      ) # end sidebarLayout
                      )#, # end tabPanel
  )
)