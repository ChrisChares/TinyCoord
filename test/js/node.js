var chai = require('chai');
var expect = chai.expect;
var tc = require('../js/tinycoord.js');


describe('Conversion', function() {
  it('should encode', function() {

    var encoded = tc.encode(19, {
    	latitude: 104.33324432373047,
    	longitude: -39.44114303588867
    })
    var string = "E5+q0EK7wx3C";
    expect(encoded).to.equal(string);
  });

  it('should decode', function() {
    
    var string = "E5+q0EK7wx3C";
    var decoded = tc.decode(string);

    expect(decoded.zoom).to.equal(19);
  });

});
