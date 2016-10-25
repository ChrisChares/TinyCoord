var chai = require('chai');
var expect = chai.expect;
var tc = require('../js/tinycoord.js');


describe('Array', function() {
  it('should start empty', function() {
    
    var string = "E5+q0EK7wx3C";

    var encoded = tc.encode(19, {
    	latitude: 104.33324432373047,
    	longitude: -39.44114303588867
    })
    expect(encoded).to.equal(string);
  });
});




