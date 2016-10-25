var base64Buffer = require('base64-arraybuffer');

function decode(string) {
	var buffer = base64Buffer.decode(string);

	var zoom = new DataView(buffer).getUint8(0);

	var floatsBuffer = buffer.slice(1, buffer.byteLength);
	var floatsArray = new Float32Array(floatsBuffer);

	var coord = {
		latitude: floatsArray[0],
		longitude: floatsArray[1]
	}
	return {
		coordinate: coord,
		zoom: zoom
	};
};

function encode(zoom, coordinate) {
	var zoomBuffer = new ArrayBuffer(1);
	var dataView = new DataView(zoomBuffer);

	dataView.setUint8(0, zoom);

	var coordBuffer = Float32Array.from([coordinate.latitude, coordinate.longitude]).buffer;

	var tmp = new Uint8Array(9);
	tmp.set(new Uint8Array(zoomBuffer), 0);
	tmp.set(new Uint8Array(coordBuffer), 1);

	return base64Buffer.encode(tmp.buffer);
};

module.exports.decode = decode;
module.exports.encode = encode;