//
//  Coordinate.swift
//  Stormy
//
//  Created by Josh Gude on 2/22/20.
//  Copyright © 2020 Treehouse. All rights reserved.
//

import Foundation

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

extension Coordinate: CustomStringConvertible {
    var description: String {
        return "\(latitude),\(longitude)"
    }
    
    static var alcatrazIsland: Coordinate {
        return Coordinate(latitude: 37.8267, longitude: -122.4233)
    }
}
