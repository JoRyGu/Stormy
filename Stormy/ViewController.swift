//
//  ViewController.swift
//  Stormy
//
//  Created by Pasan Premaratne on 5/8/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var locationLabel: UILabel!
    
    let client = DarkSkyAPIClient()
    let locationManager = CLLocationManager()
    var location = Coordinate.alcatrazIsland
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestWhenInUseAuthorization()
    
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        }
        
        refreshData()
    }
    
    func displayWeather(using viewModel: CurrentWeatherViewModel) {
        currentTemperatureLabel.text = viewModel.temperature
        currentHumidityLabel.text = viewModel.humidity
        currentPrecipitationLabel.text = viewModel.precipitationProbability
        currentWeatherIcon.image = viewModel.icon
        
        currentSummaryLabel.text = viewModel.summary
    }
    
    func getCurrentWeather() {
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        client.getCurrentWeather(at: location) { [unowned self] currentWeather, error in
            if let currentWeather = currentWeather {
                let viewModel = CurrentWeatherViewModel(model: currentWeather)
                self.displayWeather(using: viewModel)
            }
            
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let locationFromManager: CLLocation = manager.location else {
            return
        }
        
        let coordinatesFromLocation = locationFromManager.coordinate
        
        location = Coordinate(latitude: coordinatesFromLocation.latitude, longitude: coordinatesFromLocation.longitude)
        
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(locationFromManager) { placemarks, error in
            if error == nil {
                self.locationLabel.text = placemarks?[0].locality
            }
        }
        
        getCurrentWeather()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    @IBAction func refreshData() {
        locationManager.requestLocation()
    }
}

