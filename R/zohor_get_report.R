
#'Downloads report from Zoho creator
#'
#'@param zohor_report A string. name of the report (link name) in Zoho creator
#'@result A tibble with the report information

zohor_get_report = function(zohor_report,
                            ...){



  #define the api

  api_report = glue("{zohor_server}{zohor_report}")

  #ask for the report in the server
  response_report = GET(api_report,
                        query = list(authtoken = zohor_token ,
                                     scope = zohor_scope ,
                                     zc_ownername = zohor_ownername)
  )


  status_response = response_report$status_code

  #convert report to a tibble
  if(status_response == 200){
    content_text = content(response_report, "text")
    remove_this = glue("var zoho{zohor_ownername}view[0-9][0-9][0-9] = ")
    content_clean = str_remove(content_text, remove_this)
    content_clean2 = str_remove(content_clean,";$" )

    #remove prefix from the name
    list_raw = fromJSON(content_clean2, flatten = T)
    tibble_raw = tibble(list_raw[[1]])
    new_col_names = str_remove(names(tibble_raw), ".+(?=\\.)\\.")

    message(glue("OK: status of query is {status_response}, a tibble with {nrow(tibble_raw)} observations
             has been created for {report}"))

    return(tibble_raw)

    #let the user now that something went wrong
  } else if(status_response != 200) {

    message(glue("Warning: status of query is {status_response}"))
  }



}



