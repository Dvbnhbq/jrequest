request = require './index.js'

request 'http://google.com'
.done (data) ->
	console.log data
.fail (err) ->
	console.log "Error",err.statusCode