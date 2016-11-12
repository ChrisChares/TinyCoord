//: Playground - noun: a place where people can play

import CoreLocation


let coord = CLLocationCoordinate2D(latitude: 104.333243, longitude: -39.441143)

let string = try TinyCoord.convertToString(fromCoordinate: coord, zoom: 19)
let (coord2, zoom) = try TinyCoord.convert(fromString: string)

zoom == 19
coord.latitude == coord2.latitude
coord.longitude == coord.longitude

print(coord2.latitude)
print(string)