request = require 'jrequest.js'

request.get 
	url: 'http://google.com'
.done (data) ->
	console.log data
.fail (err) ->
	console.log "Error",err.statusCode