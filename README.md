# Zagori Test HTTP server

## Endpoints

* `/ping/:id` - HTTP reponse has code `id`
* `/delay/:ms` - Delay `ms` milliseconds and respond with HTTP 200
* `/redirect/:code` - Redirect to `www.google.com` with redirect code `code`
* `/download` - Download an infinite file
