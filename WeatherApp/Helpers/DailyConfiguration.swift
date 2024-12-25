//
//  DailyConfiguration.swift
//  WeatherApp
//
//  Created by Habil Demirci on 25.12.2024.
//

import Foundation

//Converts the date received from the API to the current day.
class DateConfiguration {
    //Functions
    class func convertDateToDayName(date: String, identifier: String) -> String {
        var dayName: String!
        
        let dateFormatterForMainDate = DateFormatter()
        dateFormatterForMainDate.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterForDay = DateFormatter()
        dateFormatterForDay.dateFormat = identifier
        dateFormatterForDay.locale = Locale(identifier: "tr_TR")
        
        if let date = dateFormatterForMainDate.date(from: date) {
            dayName = dateFormatterForDay.string(from: date)
        } else {
            print("There was an error decoding the string")
        }
        
        return dayName
    }
}
