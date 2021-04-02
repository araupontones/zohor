#' Define API credentials for your Zoho creator app
#'
#' #'\code{zohor_login()} saves these credentials in the global environment so
#' they can be used to communicate with the server
#'This function must be run before any other function of this
#'package \code{zohor}.
#' @param zohor_server A string. URL of your App.
#' @param  zohor_user A string. email address of
#' your user in Zoho creator.
#' @param zohor_password A string. Password of the API user.
#' @param  zohor_ownername A string. Owner of the app
#' @param zoho_scope A string. Scope of the query. Default = "creatorapi"
#' @param zoho_token A string. Token of the API
#' @return  All the parameters provided to the function (\code{zohor_server},
#' \code{zohor_user},  \code{zohor_password}), etc. will be saved in your global environment so can be used
#' in your workflow. A
#' @examples
#' zohor_login(zohor_server = "https://creator.zoho.com/api/json/myapp/view/",
#'               zoho_user = "ronaldo",
#'                zohor_ownername = "ronaldogmail.com,
#'                zoho_scope = "creatorapi,
#'                zoho_token = XXXXXXXXX,
#'                zohor_password = golazosolitario,
#'              )

#'
#'
#'





zohor_login = function(zohor_server,
                       zohor_user,
                       zohor_ownername,
                       zohor_scope,
                       zohor_token,
                       zohor_password,
                       ...){

  names <- c("zohor_server", "zohor_user", "zohor_ownername", "zohor_scope", "zohor_token", "zohor_password")
  values <-  c(zohor_server, zohor_user, zohor_ownername, zohor_scope, zohor_token, zohor_password)

  #save parameters in global directory
  invisible(
    lapply(seq_along(1:length(names)),
           function(x){

             message(paste(names[[x]], "stored in global environment"))
             assign(names[[x]], value = values[[x]], envir = .GlobalEnv)
           })
  )
}
