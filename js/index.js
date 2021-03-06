// Generated by CoffeeScript 1.10.0
var jrequest, ref, reqF, request,
  slice = [].slice;

require('source-map-support').install();

request = require('request');

reqF = function(action, settings, success) {
  var req;
  req = action(settings, function(err, response, data) {
    if (!err && response.statusCode === 200) {
      if (typeof success === "function") {
        success.apply(null, arguments);
      }
      if (typeof req._done === "function") {
        req._done(data);
      }
    } else if (!err) {
      if (typeof req._fail === "function") {
        req._fail.apply(req, arguments);
      }
    }
    return typeof req._always === "function" ? req._always(data, err, response) : void 0;
  }).on('error', function() {
    return typeof req._fail === "function" ? req._fail.apply(req, arguments) : void 0;
  });
  req.done = function(cb) {
    req._done = cb;
    return req;
  };
  req.fail = function(cb) {
    req._fail = cb;
    return req;
  };
  req.always = function(cb) {
    req._always = cb;
    return req;
  };
  return req;
};

ref = [request, request.post, request.get].map(function(elem) {
  return function() {
    return reqF.apply(null, [elem].concat(slice.call(arguments)));
  };
}), jrequest = ref[0], jrequest.post = ref[1], jrequest.get = ref[2];

module.exports = jrequest;

//# sourceMappingURL=index.js.map
