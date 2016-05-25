request = require 'request'

jrequest = (settings, success) ->
	req = request settings, (err, response, data) ->
		if !err && response.statusCode == 200
			req._done data 
		else if !err
			req._fail response, data
	.on 'error', (err) ->
		req._fail err
	
	req.done = (cb) ->
		req._done = cb
		req
	req.fail = (cb) ->
		req._fail = cb
		req
	req


module.exports = jrequest