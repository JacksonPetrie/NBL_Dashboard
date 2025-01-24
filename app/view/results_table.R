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
    card(
      class = "filter",
      style = "width: 100%; padding: 10px;",
      h2("Filters")
    ),
    card(
      class = "content",
      style = "width: 100%; padding: 10px;",
      reactableOutput(ns("table"))
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