//
//  WeatherDescription.swift
//  WeatherApp
//
//  Created by Habil Demirci on 25.12.2024.
//

import UIKit

struct WeatherDescription: Codable {
    
    // Properties
    
    var iconName: String
    var description: String
    
    var icon: UIImage? {
        return UIImage(named: iconName)
    }
    
    enum CodingKeys: String, CodingKey {
        case iconName = "icon"
        case description = "description"
    }
}
