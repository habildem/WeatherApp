//
//  DayWeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Habil Demirci on 25.12.2024.
//

import UIKit

class DayWeatherTableViewCell: UITableViewCell {

    //UI Elements
    @IBOutlet weak var dayNameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    
    //Functions
    func update(with weather: DailyWeather) {
        dayNameLabel.text = DateConfiguration.convertDateToDayName(date: weather.dateTime, identifier: "EEEE")
        iconImageView.image = weather.weatherDescription.icon
        maxTemperatureLabel.text = "\(Int(weather.maxTemperature))"
        minTemperatureLabel.text = "\(Int(weather.minTemperature))"
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
