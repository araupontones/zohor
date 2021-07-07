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
  limit = 200,
  from = 1
){

  query_report <- glue("{url_app}/api/v2/{account_owner_name}/{app_link_name}/report/{report_link_name}")

  response_report <-  GET(query_report,
                          add_headers(Authorization = glue('Zoho-oauthtoken {access_token}')),
                          query = list(criteria = criteria,
                                       limit = limit,
                                       from = from)) #filter by country

  status <- status_code(response_report)

 #report status to client

  if(status == 200){

    cli::cli_alert_success(status)
  } else {

    cli::cli_alert_danger(status)

  }


  raw_report <- fromJSON(content(response_report, 'text'))$data


  #re-format to extract the columns with class data.frate
  formated_report <- raw_report
  for(cols in names(formated_report)){

    #check the class of every column
    clase <- class(formated_report[[cols]])


    if(clase == "data.frame") {

      #remove data frame from main table
      formated_report = select(formated_report, - cols)

      #create own data set for this
      extracted_table = raw_report[[cols]]

      names(extracted_table) <- c(cols, glue("ID_{cols}"))

      #bind tables
      formated_report <- cbind(formated_report, extracted_table)



    }

  }



  return(formated_report)

}



#example to get results from Mexico

