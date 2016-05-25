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
		req._always? data, err, response
	.on 'error', ->
		req._fail? arguments...
	
	req.done = (cb) ->
		req._done = cb
		req
	req.fail = (cb) ->
		req._fail = cb
		req
	req.always = (cb) ->
		req._always = cb
		req
	req


[jrequest, jrequest.post, jrequest.get] = [request, request.post, request.get]
.map (elem) ->
	->
		reqF elem, arguments...


module.exports = jrequest