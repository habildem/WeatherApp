//
//  URL+Ext.swift
//  WeatherApp
//
//  Created by Habil Demirci on 25.12.2024.
//

import UIKit

extension URL {
    func addingQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.key, value: $0.value) }
        return components?.url
    }
}
