//
//  DailyViewController.swift
//  WeatherApp
//
//  Created by Habil Demirci on 25.12.2024.
//

import UIKit

class DailyViewController: UIViewController {

    //UI Elements
    
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherStatusLabel: UILabel!
    
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    
    @IBOutlet weak var windDirectionLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    @IBOutlet weak var uvIndexLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    //Functions
    func updateUI(with weather: Weather) {
        guard let today = weather.data.first else { return }
        
        dateLabel.text = DateConfiguration.convertDateToDayName(date: today.dateTime, identifier: "d MMM, EEEE")
        temperatureLabel.text = "\(Int(today.temperature))°"
        weatherIconImageView.image = today.weatherDescription.icon
        cityNameLabel.text = weather.cityName
        weatherStatusLabel.text = today.weatherDescription.description
        maxTemperatureLabel.text = "\(Int(today.maxTemperature))°"
        minTemperatureLabel.text = "\(Int(today.minTemperature))°"
        windDirectionLabel.text = today.windDirection
        windSpeedLabel.text = "\(String(format: "%1.f",today.windSpeed)) km/s"
        uvIndexLabel.text = String(format: "%1.f", today.uvIndex)
        humidityLabel.text = "%\(today.relativeHumidity)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
