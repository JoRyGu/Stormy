//
//  CurrentWeather.swift
//  Stormy
//
//  Created by Josh Gude on 2/19/20.
//  Copyright © 2020 Treehouse. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeather: Codable {
    let temperature: Double
    let humidity: Double
    let precipProbability: Double
    let summary: String
    let icon: String
}

extension CurrentWeather {
    var iconImage: UIImage {
        switch icon {
        case "clear-day": return UIImage(named: "clear-day")!
        case "clear-night": return UIImage(named: "clear-night")!
        case "rain": return UIImage(named: "rain")!
        case "snow": return UIImage(named: "snow")!
        case "sleet": return UIImage(named: "sleet")!
        case "wind": return UIImage(named: "wind")!
        case "fog": return UIImage(named: "fog")!
        case "cloudy": return UIImage(named: "cloudy")!
        case "partly-cloudy-day": return UIImage(named: "partly-cloudy-day")!
        case "partly-cloudy-night": return UIImage(named: "cloudy-night")!
        default: return UIImage(named: "default")!
        }
    }
}
