box::use(
  htmltools[div, h2],
  reactable[reactableOutput, renderReactable],
  shiny.semantic[card],
  shiny[div, moduleServer, NS, req],
)

box::use(
  app/logic/results_reactable,
)

#' @export
ui <- function(id) {
  ns <- NS(id)

  div(
    class = "match_results",
    div(
      class = "filter_container",
      card(
        class = "filter",
        h2("Filters")
      )
    ),
    div(
      class = "content_container",
      card(
        class = "results_table",
        reactableOutput(ns("table"))
      )
    )
  )
}


#' @export
server  <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    output$table <- renderReactable({
      req(data)  # Ensure data is available before rendering
      results_reactable$table(data)
    })

  })
}