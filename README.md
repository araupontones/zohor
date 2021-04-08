# zohor
Zoho creator API with R

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
