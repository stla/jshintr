widget_html.jshintr <- function(id, style, class, ...) {
  tags$div(
    id = "jshintr-body",
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
      )
    )
  )
}


#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
jshintr <- function(filepath, width = NULL, height = NULL, elementId = NULL) {

  source <- paste0(readLines(filepath), collapse = "\n")

  # forward options using x
  x = list(
    source = source
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'jshintr',
    x,
    width = width,
    height = height,
    package = 'jshintr',
    elementId = elementId
  )
}

#' Shiny bindings for jshintr
#'
#' Output and render functions for using jshintr within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a jshintr
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name jshintr-shiny
#'
#' @export
jshintrOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'jshintr', width, height, package = 'jshintr')
}

#' @rdname jshintr-shiny
#' @export
renderJshintr <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, jshintrOutput, env, quoted = TRUE)
}
