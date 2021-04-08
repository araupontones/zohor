#' Make authorization request
#'
#' This function should be ran only once to create a user code.
#' It will make a request. Once the request is made, copy the code (it will be valid for 1 minute)
#'
#' @param client_id A string. The client ID that was generated when you
#' [registered the client application](https://www.zoho.com/creator/help/api/v2/register-client.html)
#' @param scope A string. The Zoho creator scope that you want to access. See
#' [scope documentation](https://www.zoho.com/creator/help/api/v2/oauth-overview.html)
#' @param redirect_url A url. One of the authorized redirect URIs that you associated
#' while registering the [client application.](https://www.zoho.com/creator/help/api/v2/register-client.html)
#'
#' @return A browser to accept the authorization will prompt. Click OK. Upon
#' Accept the request will be approved and the user will be redirected back to
#' URI of the client application (that was specified in the previous step) with keys in the query string. For example:
#' https://www.zylker.com/callback?*code*=1000.xxxxxxxxe1a88.xxxxxxxx40a3&*location*=us&*accounts-server*=https%3A%2F%2Faccounts.zoho.com


generate_auth_code <- function(client_id,
                               scope = c("ZohoCreator.report.READ",
                                         "ZohoCreator.meta.application.READ"),
                               redirect_url){

  api2_zoho <- "https://accounts.zoho.com/oauth/v2"
  url_auth_request = glue("{api2_zoho}/auth?response_type=code&client_id={client_id}&scope={scope}&redirect_uri={redirect_url}&access_type=offline")

  return(browseURL(url_auth_request))
  #return(url)


}
