request = require 'jrequest'
#request = require '.'

request.get 
	url: 'http://www.google.com'
.done (data) ->
	console.log data
.fail (err, data) ->
	console.log "Error", err.statusCode, data
.always (data) ->
	console.log "Always", data
