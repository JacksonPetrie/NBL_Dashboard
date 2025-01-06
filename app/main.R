box::use(
  htmltools[div, h1, img],
  shiny.router[route, route_link, router_ui],
  shiny.semantic[menu, menu_item, semanticPage],
  shiny[moduleServer, NS],
)

box::use(
  app/view/table,
)

#' @export
ui <- function(id) {
  ns <- NS(id)

  semanticPage(
    title = "NBL Dashboard",
    div(
      style = "display: flex; align-items: center; margin-left: 10px; margin-bottom: 10px;",
      img(src = "static/Main_logo.png", height = "40px"),
      h1("NBL Dashboard")
    ),
    div(style = "margin-left: 10px !important; margin-right: 10px !important;",
      menu(
        menu_item(
          "Season Stats",
          href = route_link("season_stats")
        )
      )
    ),
    div(class = "content",
      style = "margin-left: 10px; margin-right: 10px;",
      router_ui(
        route("season_stats", table$ui(ns("season_stats")))
      )
    )
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {

  })
}
