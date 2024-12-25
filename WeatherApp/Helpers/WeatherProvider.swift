//
//  WeatherProvider.swift
//  WeatherApp
//
//  Created by Habil Demirci on 25.12.2024.
//
import CoreLocation
import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        components.queryItems = queries.map { URLQueryItem(name: $0.key, value: $0.value)}
        return components.url
    }
}
// Allows us to fetch data from the API.
class WeatherProvider {
    
    //Properties
    private let apiKey = "404c84fc29e1412f96723394698aafc8"
    private let baseURL = URL(string: "https://api.weatherbit.io/v2.0/forecast/daily")!
    private let jsonDecoder = JSONDecoder()
    
    //Functions
    
    func getWeather(for location: CLLocationCoordinate2D, completion: @escaping (Weather?) -> Void) {
        let queries: [String: String] = [
            "lat": String(location.latitude),
            "lon": String(location.longitude),
            "lang": "tr",
            "key": apiKey
        ]
        
        let requestURL = baseURL.withQueries(queries)!
        
        URLSession.shared.dataTask(with: requestURL) { data, _, _ in
            guard let weatherData = data else {
                completion(nil)
                return
            }
            do {
                let weather = try self.jsonDecoder.decode(Weather.self, from: weatherData)
                DispatchQueue.main.async {
                    completion(weather)
                }
            } catch {
                completion (nil)
                print("Error decoding: \(error.localizedDescription)")
            }
        
        }.resume()
        }
    }

