//
//  Weather.swift
//  WeatherApp
//
//  Created by Habil Demirci on 25.12.2024.
//

import Foundation

struct Weather: Codable {
    
    //  Properties
    var cityName: String
    var data: [DailyWeather]
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case data = "data"
    }
}
