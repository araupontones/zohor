% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/refresh_token.R
\name{refresh_token}
\alias{refresh_token}
\title{Refresh the access token}
\usage{
refresh_token(base_url, refresh_token, client_id, client_secret)
}
\arguments{
\item{base_url}{A url. [The base URL of your Zoho Account](https://accounts.zoho.com/oauth/serverinfo)
For example, it's accounts.zoho.com if your account belongs to Zoho's US DC.}

\item{refresh_token}{The refresh token that belongs to the requesting user,
which is returned when the access_type=offline is included in the query string
of the authorization request (this is the output of  \code{get_token()})}

\item{client_id}{A string. The client credentials that were generated when you registered the
[client application](https://www.zoho.com/creator/help/api/v2/register-client.html)
 @param client_secret  A string. The client credentials that were generated when you registered the
[client application](https://www.zoho.com/creator/help/api/v2/register-client.html)}
}
\value{
a new access_token
}
\description{
Access tokens expire in an hour. Client applications must make the following
request and use their user's refresh token to generate another access token
}
