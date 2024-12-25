//
//  DailyWeather.swift
//  WeatherApp
//
//  Created by Habil Demirci on 25.12.2024.
//

import UIKit

struct DailyWeather: Codable {
    var maxTemperature: Double
    var minTemperature: Double
    var dateTime: String
    var temperature: Double
    var uvIndex: Double
    var windDirection: String
    var windSpeed: Double
    var relativeHumidity: Int
    var changeOfSnow: Double
    var cloudCoverance: Int
    var weatherDescription: WeatherDescription
    
    enum CodingKeys: String, CodingKey {
        case maxTemperature = "max_temp"
        case minTemperature = "min_temp"
        case dateTime = "datetime"
        case temperature = "temp"
        case uvIndex = "uv"
        case windDirection = "wind_cdir"
        case windSpeed = "wind_spd"
        case relativeHumidity = "rh"
        case changeOfSnow = "snow"
        case cloudCoverance = "clouds"
        case weatherDescription = "weather"
    }
}
