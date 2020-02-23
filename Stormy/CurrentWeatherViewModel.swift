//
//  CurrentWeatherViewModel.swift
//  Stormy
//
//  Created by Josh Gude on 2/19/20.
//  Copyright © 2020 Treehouse. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeatherViewModel {
    let temperature: String
    let humidity: String
    let precipitationProbability: String
    let summary: String
    let icon: UIImage
    
    init (model: CurrentWeather) {
        self.temperature = "\(Int(model.temperature))º"
        self.humidity = "\(Int(model.humidity * 100))%"
        self.precipitationProbability = "\(Int(model.precipProbability * 100))%"
        self.summary = model.summary
        self.icon = model.iconImage
    }
}
