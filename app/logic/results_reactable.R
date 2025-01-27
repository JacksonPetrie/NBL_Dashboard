box::use(
  dplyr[select],
  reactable[colDef, reactable],
)

#' @export
table <- function(data) {

  reactable(data,
    highlight = TRUE,
    fullWidth = TRUE,
    defaultPageSize = 30,
    style = list(
      overflowX = "auto"
    ),
    defaultColDef = colDef(
      minWidth = 150,
      maxWidth = 200,
      na = "-",
      align = "center",
    ),
    columns = list(
      season = colDef(
        name = "Season"
      ),
      round_number = colDef(
        name = "Round"
      ),
      venue_name = colDef(
        name = "Venue"
      )
    )
  )
}