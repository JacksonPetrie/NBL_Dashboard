box::use(
  htmltools[div],
  shiny.semantic[card],
  shiny[div, moduleServer, NS],
)

#' @export
ui <- function(id) {
  ns <- NS(id)

  div(
    card(

    )
  )
}


#' @export
server  <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

  })
}