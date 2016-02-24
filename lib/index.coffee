path = require 'path'
express = require 'express'

PORT = 80
app = express()

app.all '*', (req, res, next) ->
	console.log("#{req.method} #{req.url}")
	next()

app.use('/', express.static(path.join(__dirname, '..', 'public')))

app.get '/ping/:id', (req, res) ->
	res.writeHead(200)
	res.end("#{req.url}")

app.get '/delay/:ms', (req, res) ->
	setTimeout () ->
		res.writeHead(200)
		res.end("#{req.url}")
	, req.params.ms ? 0

app.listen PORT, ->
	console.log("Server listening on port #{PORT}")
