var tc = require('./js/tinycoord.js');

var string = "E5+q0EK7wx3C";

console.log(tc.decode(string));

var encoded = tc.encode(19, {
	latitude: 104.33324432373047,
	longitude: -39.44114303588867
})

console.log(encoded);
console.log(tc.decode(encoded));

