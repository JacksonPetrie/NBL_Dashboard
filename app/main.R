box::use(
  htmltools[div, img],
  nblR[nbl_results],
  shiny.router[route, route_link, router_server, router_ui],
  shiny.semantic[icon, menu, menu_header, menu_item, semanticPage],
  shiny[moduleServer, NS, observe],
)

box::use(
  app/logic/results_wide_cleaning,
  app/view/results_table,
)

#' @export
ui <- function(id) {
  ns <- NS(id)

  semanticPage(
    title = "NBL Dashboard",
    style = "margin: 0px;",
    div(
      class = "base",
      div(
        class = "sidebar",
        div(
          class = "logo",
          img(src = "static/Main_logo.png", height = "70px")
        ),
        div(
          class = "selection menu",
          menu(
            class = "ui vertical secondary menu",
            menu_item(
              "Fixture",
              href = route_link("results_table")
            ),
            menu_item(
              "Team",
              href = route_link("placeholder")
            ),
            menu_item(
              "Player",
              href = route_link("placeholder")
            ),
            menu_item(
              "Advanced",
              href = route_link("placeholder")
            )
          )
        ),
        div(
          class = "bottom menu",
          menu(
            class = "ui three item secondary menu",
            menu_item(
              icon(
                class = "cog icon"
              )
            ),
            menu_item(
              icon(
                class = "info circle icon"
              )
            ),
            menu_item(
              icon(
                class = "user circle icon"
              )
            )
          )
        )
      ),
      div(
        class = "content",
        router_ui(
          route("results_table", results_table$ui(ns("results_table")))
        )
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
