require 'source-map-support'
.install()

request = require 'request'

reqF = (action, settings, success) ->
	req = action settings, (err, response, data) ->
		if !err && response.statusCode == 200
			success? arguments...
			req._done? data 
		else if !err
			req._fail? response, data
	.on 'error', (err) ->
		req._fail? err
	
	req.done = (cb) ->
		req._done = cb
		req
	req.fail = (cb) ->
		req._fail = cb
		req
	req


[jrequest, jrequest.post, jrequest.get] = [request, request.post, request.get]
.map (elem) ->
	->
		reqF elem, arguments...


module.exports = jrequest