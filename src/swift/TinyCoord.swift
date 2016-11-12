import Foundation
import CoreLocation

private func readFloat(data : NSData, start : Int) -> Float {
    var d : Float = 0.0
    data.getBytes(&d, range: NSRange(location: start, length: MemoryLayout<Float>.size))
    return d
}

private func readZoom(data: NSData) -> UInt8 {
    var z: UInt8 = 0
    data.getBytes(&z, range: NSRange(location: 0, length: 1))
    return z
}

public enum TinyCoordError : Error {
    case invalidString
    case invalidZoom
}

public struct TinyCoord {
    public static func convertToString(fromCoordinate coord: CLLocationCoordinate2D, zoom: Int) throws -> String {
        
        guard zoom >= 0 && zoom <= 21 else { throw TinyCoordError.invalidZoom }
        
        var data = Data()
        
        var z = zoom
        var lat = Float(coord.latitude)
        var lon = Float(coord.longitude)
        
        data.append(Data(bytes: &z, count: 1))
        data.append(Data(bytes: &lat, count: 4))
        data.append(Data(bytes: &lon, count: 4))
        
        return data.base64EncodedString(options: [])
    }
    
    public static func convert(fromString string: String) throws -> (CLLocationCoordinate2D, UInt8) {
        
        guard string.characters.count == 12 else { throw TinyCoordError.invalidString }
        guard let data = Data(base64Encoded: string) else { throw TinyCoordError.invalidString }
        
        let zoom = readZoom(data: data as NSData)
        let latitude = readFloat(data: data as NSData, start: 1)
        let longitude = readFloat(data: data as NSData, start: 5)
        let coord = CLLocationCoordinate2D(latitude: Double(latitude), longitude: Double(longitude))
        
        return (coord, zoom)
    }
}
