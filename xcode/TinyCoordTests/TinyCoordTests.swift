//
//  TinyCoordTests.swift
//  TinyCoordTests
//
//  Created by Chris on 11/11/16.
//  Copyright © 2016 Denver Mapping Company. All rights reserved.
//

import XCTest
@testable import TinyCoord
import CoreLocation

/*
    Provide the degree of precision to check equality to.  Default precision is 5 digits.
*/
private func fudge(_ number: Double, _ precision: Int) -> Int {
    let multiple = pow(10.0, Double(precision))
    return Int(number * multiple)
}

private func fudgedEquality(_ lhs: Double, _ rhs: Double, precision: Int = 5) {
    XCTAssertEqual(fudge(lhs, precision), fudge(rhs, precision))
}

class TinyCoordTests: XCTestCase {

    func testExample() {
        
        let coord = CLLocationCoordinate2D(latitude: 104.333243, longitude: -39.441143)
        
        let string = try! TinyCoord.convertToString(fromCoordinate: coord, zoom: 19)
        let (coord2, zoom) = try! TinyCoord.convert(fromString: string)
        
        XCTAssertEqual(zoom, 19)
        
        fudgedEquality(coord.latitude, coord2.latitude)
        fudgedEquality(coord.longitude, coord2.longitude)
    }
}
