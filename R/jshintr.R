#' @importFrom htmltools tags
#' @noRd
widget_html.jshintr <- function(id, style, class, ...) {
  tags$div(
    id = "jshintr-body",
    tags$div(id = "jshintr-file"),
    tags$div(
      id = "jshintr-radio",
      class = "jshintr-radio-container",
      role = "radiogroup",
      `aria-labelledby` = "jshintr-radio-label",
      tags$label(
        class = "jshintr-label",
        id = "jshintr-radio-label",
        `for` = "jshintr-radio",
        "ES version:"
      ),
      tags$div(
        class = "jshintr-options-group",
        tags$label(
          class = "jshintr-radio-inline",
          tags$input(
            type = "radio",
            name = "jshintr-radio",
            value = "3"
          ),
          tags$span("3")
        ),
        tags$label(
          class = "jshintr-radio-inline",
          tags$input(
            type = "radio",
            name = "jshintr-radio",
            value = "5"
          ),
          tags$span("5")
        ),
        tags$label(
          class = "jshintr-radio-inline",
          tags$input(
            type = "radio",
            name = "jshintr-radio",
            value = "6",
            checked = ""
          ),
          tags$span("6")
        ),
        tags$label(
          class = "jshintr-radio-inline",
          tags$input(
            type = "radio",
            name = "jshintr-radio",
            value = "7"
          ),
          tags$span("7")
        ),
        tags$label(
          class = "jshintr-radio-inline",
          tags$input(
            type = "radio",
            name = "jshintr-radio",
            value = "8"
          ),
          tags$span("8")
        ),
        tags$label(
          class = "jshintr-radio-inline",
          tags$input(
            type = "radio",
            name = "jshintr-radio",
            value = "9"
          ),
          tags$span("9")
        ),
        tags$label(
          class = "jshintr-radio-inline",
          tags$input(
            type = "radio",
            name = "jshintr-radio",
            value = "10"
          ),
          tags$span("10")
        ),
        tags$label(
          class = "jshintr-radio-inline",
          tags$input(
            type = "radio",
            name = "jshintr-radio",
            value = "11"
          ),
          tags$span("11")
        )
      )
    ),
    tags$br(),
    tags$div(
      id = id,
      class = class,
      style = style,
      tags$table(
        id = "jshintr-tbl",
        border = "1",
        tags$thead(
          tags$tr(
            tags$th("line"),
            tags$th("col"),
            tags$th("evidence"),
            tags$th("reason"),
            tags$th("raw"),
            tags$th("code"),
            tags$th("scope"),
            tags$th("id")
          ),
          tags$tbody(
            id = "jshintr-tblBody"
          )
        )
      ),
      tags$p(id = "jshintr-p")
    )
  )
}


#' <Add Title>
#'
#' <Add Description>
#'
#' @importFrom htmlwidgets createWidget
#'
#' @export
jshintr <- function(filepath, width = NULL, height = "auto", elementId = NULL) {

  source <- paste0(readLines(filepath), collapse = "\n")

  # forward options using x
  x <- list(
    filename = basename(filepath),
    source = source
  )

  # create widget
  createWidget(
    name = "jshintr",
    x,
    width = width,
    height = height,
    package = "jshintr",
    elementId = elementId
  )
}
