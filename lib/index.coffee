path = require 'path'
express = require 'express'
Randstream = require 'randstream'

rand = new Randstream
	mode: 'alpha'
	defaultSize: 4096

PORT = 80
app = express()

app.all '*', (req, res, next) ->
	console.log("#{req.method} #{req.url}")
	next()

app.use('/', express.static(path.join(__dirname, '..', 'public')))

app.get '/ping/:id', (req, res) ->
	res.writeHead(200)
	res.end("#{req.url}")

app.get '/lekkas', (req, res) ->
	res.writeHead(200)
	res.end("#{req.url}")

app.get '/john', (req, res) ->
	res.writeHead(200)
	res.end("#{req.url} - test4")

app.get '/delay/:ms', (req, res) ->
	setTimeout () ->
		res.writeHead(200)
		res.end("#{req.url}")
	, req.params.ms ? 0

app.get '/redirect/:code', (req, res) ->
	code = parseInt(req.params?.code ? '302')
	res.redirect(code, 'http://www.google.com')

app.get '/download', (req, res) ->
	rand.pipe(res)

app.listen PORT, ->
	console.log("Server listening on port #{PORT}")
