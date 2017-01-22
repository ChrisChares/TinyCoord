const base64Buffer = require('base64-arraybuffer');

function decode(string) {
	let buffer = base64Buffer.decode(string);

	let zoom = new DataView(buffer).getUint8(0);

	let floatsBuffer = buffer.slice(1, buffer.byteLength);
	let floatsArray = new Float32Array(floatsBuffer);

	let coord = {
		latitude: floatsArray[0],
		longitude: floatsArray[1]
	}
	return {
		coordinate: coord,
		zoom: zoom
	};
};

function encode(zoom, coordinate) {
	let zoomBuffer = new ArrayBuffer(1);
	let dataView = new DataView(zoomBuffer);

	dataView.setUint8(0, zoom);

	let typedArray = new Float32Array([coordinate.latitude, coordinate.longitude]);
	let buffer = typedArray.buffer;

	var tmp = new Uint8Array(9);
	tmp.set(new Uint8Array(zoomBuffer), 0);
	tmp.set(new Uint8Array(buffer), 1);

	return base64Buffer.encode(tmp.buffer);
};

module.exports.decode = decode;
module.exports.encode = encode;