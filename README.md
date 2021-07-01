# zohor
Zoho creator API with R

#Example (look to repo cv/03_download_zoho.R)
:
```

#define parameters of app -------------------------------------------------------
app <- "cv"
report <- "All_Projects"

refresh_token = "..."

#refresh zoho token --------------------------------------------------------------
new_token <- zohor::refresh_token(
  base_url = "https://accounts.zoho.com",
  client_id = "..",
  client_secret = "..",
  refresh_token = refresh_token
)


 


#download data -----------------------------------------------------------------
projects <-zohor::get_report(url_app = "https://creator.zoho.com" ,
                  account_owner_name = ".." ,
                  app_link_name = "..",
                  report_link_name = "All_Projects",
                  access_token = new_token,
                  criteria = "ID != 0",
                  from = 1)

#function to unnest multiple select variables -------------------------------
get_value_from_list<- function(x){
  
  lapply(x, function(y){
    
    str_flatten(y[[1]], collapse = ", ")
  })
  
  
}


#unnest list columns (multiple select variables)
projects_unnested <- projects %>%   
  mutate_if(is.list,get_value_from_list)
 



```

## To do:

* Improve criteria argument of `get_report`
* in `get_report()`, clean the col names, unnest the beneficiaries
* learn how to write hyperlinks in roxygen (and amend all)

# Describe what each function does

* `generate_auth_code()`  should be ran only once to create a user code. It will make a request. Once the request is made, copy the code (it will be valid for 1 minute)

* `get_token()` Once the client application receives an authorization code (see `generate_auth_code()`), it can exchange for an access token. See [possible errors](https://www.zoho.com/creator/help/api/v2/generate-token.html)

* `refresh_token()` Refresh the access token. Access tokens expire in an hour. Client applications must make the following request and use their user's refresh token to generate another access token

* `get_report()` Get records - Quick view. This API fetches the records displayed by a report of a Zoho Creator application. Its response will contain the data from the fields displayed in the report's quick view. A maximum of 200 records can be fetched per request.


# Instruction for owner of the app

* [Register a client](https://www.zoho.com/creator/help/api/v2/register-client.html

* [Zoho Creator API v2 documentation](https://www.zoho.com/creator/help/api/v2/oauth-overview.html)


# How does the API works?

![](https://www.zohowebstatic.com/sites/default/files/creator/zc_api_oauth.png)
