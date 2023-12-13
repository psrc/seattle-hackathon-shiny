ui <- fluidPage(
  navbarPage("Seattle Open Data Hackathon",
             theme = bs_theme(base_font = font_google("Poppins")),
             # useShinyjs(),

             windowTitle = "Seattle Open Data Hackathon",

             tabPanel("Tab 1",
                      sidebarLayout(
                        sidebarPanel(source_ui('seattle')),
                        mainpanel_ui('dummy01')

                      ) # end sidebarLayout

                      ), # end tabPanel
             tabPanel("Tab 2")

  )
)