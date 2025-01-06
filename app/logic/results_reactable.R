box::use(
  reactable[colDef, reactable],
)

#' @export
table <- function(data) {

  reactable(data,
    defaultPageSize = 10,
    highlight = TRUE,
    style = list(overflowX = "auto"),
    fullWidth = TRUE,
    defaultColDef = colDef(
      minWidth = 150,
      maxWidth = 200,
      na = "-",
      align = "center",
    )
  )
}