#' Get records - Quick view
#'
#' This API fetches the records displayed by a report of a Zoho Creator application.
#' Its response will contain the data from the fields displayed in the report's quick view.
#' A maximum of 200 records can be fetched per request.
#'
#'
#' @param  url_app the base URL of your Creator account
#' For example, it's creator.zoho.com if your account belongs to Zoho's
#' US DC, and is creator.zoho.eu if it belongs to Zoho's EU DC.
#' @param account_owner_name the username of the Creator account's owner
#' @param app_link_name the link name of the target application
#' @param report_link_name the link name of the target report
#' @param access_token the refreshed access token

#' @return  A tibble of the report that was queried




#get report

get_report <- function(
  url_app,
  account_owner_name,
  app_link_name,
  report_link_name,
  access_token,
  criteria = "",
  limit = 200
){

  query_report <- glue("{url_app}/api/v2/{account_owner_name}/{app_link_name}/report/{report_link_name}")

  response_report <-  GET(query_report,
                          add_headers(Authorization = glue('Zoho-oauthtoken {access_token}')),
                          query = list(criteria = criteria,
                                       limit = limit)) #filter by country

  status <- status_code(response_report)

  message(status)


  reporte = fromJSON(content(response_report, 'text'))$data

  return(reporte)

}



#example to get results from Mexico

