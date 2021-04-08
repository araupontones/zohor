#' Refresh the access token
#'
#' Access tokens expire in an hour. Client applications must make the following
#' request and use their user's refresh token to generate another access token

#' @inheritParams get_token
#' @param refresh_token The refresh token that belongs to the requesting user,
#' which is returned when the access_type=offline is included in the query string
#' of the authorization request (this is the output of  \code{get_token()})
#'
#' @return a new access_token

refresh_token <- function(
    base_url,
    refresh_token,
    client_id,
    client_secret){

  query_refresh_token = glue("{base_url}/oauth/v2/token?refresh_token={refresh_token}&client_id={client_id}&client_secret={client_secret}&grant_type=refresh_token")

  ask_for_new_token = POST(query_refresh_token)

  status <- status_code(ask_for_new_token)

  if(status != 200){

    message(glue("status of post: {status}, check your arguments"))

    return(NULL)

  } else {

    message(glue("Status: {status}"))
    contenido <- content(ask_for_new_token)

    if(!is.null(contenido$error)){

      message(contenido$error)

    } else {


      new_token <- contenido$access_token


      message("A new access token has been generated")

      return(new_token)


    }




  }



}




