#' @importFrom rstudioapi hasFun documentPath
#' @importFrom tools file_ext
#' @keywords internal
jshintAddin <- function(){
  if(!hasFun("documentPath")){
    message("This version of RStudio is too old!")
    return(invisible(NULL))
  }
  fp <- documentPath()
  ext <- tolower(file_ext(fp))
  if(ext != "js"){
    message("This is not a JavaScript file!")
    return(invisible(NULL))
  }
  jshintr(fp)
}

