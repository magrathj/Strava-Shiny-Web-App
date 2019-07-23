#key_set("Access-Token", "hammish-run") 
#key_set("Client-ID", "hammish-run") 
#key_set("Client-Secret", "hammish-run") 
#key_set("Refresh-Token", "hammish-run)

API_KEY <- keyring::key_get("Access-Token", "hammish-run") 


# Creates a GET request to retrieve data from an api
#
# Args:
#   url is the api which you want to access
#   api_key your access token
# Example: 
# GET_Query("https://www.strava.com/api/v3/athlete", API_KEY)
GET_Query <- function(url, api_key){
  response <- httr::GET(url, add_headers(Authorization = paste("Bearer", api_key, sep = " ")))
  return(content(response))
}




# This function refreshes the access token. 
# The access token deprecates after 6 hours and has to updated 
# with the refresh token.
#
# Args:
#   api_key and credentials as input
# Returns:
#   New access.token with corresponding time stamp
refreshToken = function(api_key) {
 return(content(httr::POST(url = 'https://www.strava.com/oauth/token', 
                           body = list(refresh_token = keyring::key_get("Refresh-Token", "hammish-run"), 
                                       client_id = as.numeric(keyring::key_get("Client-ID", "hammish-run")),
                                       client_secret = keyring::key_get("Client-Secret", "hammish-run"), 
                                       grant_type ="refresh_token"))))
}






