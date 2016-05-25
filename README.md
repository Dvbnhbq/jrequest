##Usage

Please refer to npm [request](https://www.npmjs.com/package/request) for the full information about all the options.

```js
request = require('jrequest');

request('http://google.com', function(err, response, body) {
	// Refer to 'request' package for help
})

// This is only called when 200 HTTP code is received
.done(function(data) {
  return console.log(data);
})

// Overwise
.fail(function(response, data) {
  return console.log("Error", response.statusCode || response);
})

.always(function(body, err, response) {
  return console.log("Error", err.statusCode || err);
});

// POST 
request.post('http://google.com')

// GET
request.get({
  url: 'http://google.com'
})
.done(function(data) {
  return console.log(data);
});
```