box::use(
  htmltools[div, h1, img],
  nblR[nbl_results],
  shiny.router[route, route_link, router_server, router_ui],
  shiny.semantic[menu, menu_item, semanticPage],
  shiny[moduleServer, NS, observe],
)

box::use(
  app/view/results_table,
)

#' @export
ui <- function(id) {
  ns <- NS(id)

  semanticPage(
    title = "NBL Dashboard",
    div(
      style = "display: flex; align-items: center; margin-left: 10px; margin-bottom: 10px;",
      img(src = "static/Main_logo.png", height = "40px")
    ),
    div(style = "margin-left: 10px !important; margin-right: 10px !important;",
      menu(
        menu_item(
          "Match Results",
          href = route_link("results_table")
        )
      )
    ),
    div(class = "content",
      style = "margin-left: 10px; margin-right: 10px;",
      router_ui(
        route("results_table", results_table$ui(ns("results_table")))
      )
    )
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    router_server("results_table")

    # Pull Results
    results_wide <- nbl_results(wide_or_long = "wide")
    clean_wide <- results_wide_cleaning$wide_clean(results_wide)

    #results_long <- nbl_results(wide_or_long = "long")

    # Pull Box Scores
    #box_team <- nbl_box_team()
    #box_player <- nbl_box_player()

    # Pull Shots
    #shots <- nbl_shots()

    # Pull PBP
    #pbp <- nbl_pbp()

    observe({
      results_table$server("results_table", clean_wide)
    })

  })
}
