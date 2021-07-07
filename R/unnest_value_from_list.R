#' To unnest variables of class list
#' @param x Variable in a dataset that is of list class
#' @results Extracts the elements nested in the class list variable
#' @example
#' #unnest list columns  from the dataframe projects
#' projects_unnested <- projects %>%
#'   mutate_if(is.list,unnest_value_from_list)




unnest_value_from_list<- function(x){

  lapply(x, function(y){

    str_flatten(y[[1]], collapse = ", ")
  })


}
