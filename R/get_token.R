#' Generate access token
#'
#' Once the client application receives an authorization code (see `generate_auth_code()`), it can exchange for
#' an access token. See [possible errors](https://www.zoho.com/creator/help/api/v2/generate-token.html)
#'
#' *Note*:
#' * An access token is valid for only an hour and can be used only to perform the operations defined by the scopes that were included while making the authorization request.
#' * A refresh token has no expiry. However, it can be revoked. It's purpose is to refresh the access token upon its expiry.
#' * A maximum of five refresh tokens can be generated per minute.
#'
#'
#' @param base_url A url. [The base URL of your Zoho Account](https://accounts.zoho.com/oauth/serverinfo)
#' For example, it's accounts.zoho.com if your account belongs to Zoho's US DC.
#' @param client_id  A string. The client credentials that were generated when you registered the
#' [client application](https://www.zoho.com/creator/help/api/v2/register-client.html)
#'  @param client_secret  A string. The client credentials that were generated when you registered the
#' [client application](https://www.zoho.com/creator/help/api/v2/register-client.html)
#' @param redirect_url A url. One of the authorized redirect URIs that you associated
#' while registering the [client application.](https://www.zoho.com/creator/help/api/v2/register-client.html)
#' @param code The authorization code that was generated upon making the
#' [authorization request](https://www.zoho.com/creator/help/api/v2/authorization-request.html)
#'
#' @return A list with a token and the refresh token that the requesting user will need to access the
#' resources that correspond to the scopes that were included while making the authorization request.


get_token <- function(base_url,
                      client_id,
                      client_secret,
                      redirect_url,
                      code
) {

  api_token <- glue("{base_url}/oauth/v2/token?grant_type=authorization_code&client_id={client_id}&client_secret={client_secret}&redirect_uri={redirect_url}&code={code}")

  ask_for_token <- POST(api_token)

  status <- status_code(ask_for_token)

  if(status != 200){

    message(glue("status of post: {status}, check your arguments"))

    return(NULL)

  } else {

    message(glue("Status: {status}"))
    contenido <- content(ask_for_token)

    if(!is.null(contenido$error)){

      message(contenido$error)

    } else {

      token <- contenido$access_token
      refresh_token <- contenido$refresh_token


      message("Token has been generated")
      return(list(token = token,
                  refresh_token = refresh_token,
                  content = contenido)
             )

    }




  }



}

#query to get the token -------------------------------------------------------
# query= glue("{base_url}/oauth/v2/token?grant_type=authorization_code&client_id={client_id}&client_secret={client_secret}&redirect_uri={redirect}&code={code}")
#
# p = POST(query)
# http_status(p)
