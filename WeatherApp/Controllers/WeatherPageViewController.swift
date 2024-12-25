//
//  WeatherPageViewController.swift
//  WeatherApp
//
//  Created by Habil Demirci on 25.12.2024.
//

import UIKit
import CoreLocation

class WeatherPageViewController: UIPageViewController {
    
    enum Appearance: Int {
        case daily
        case weekly
    }
    
    // UI Elements
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    lazy var DailyViewController: DailyViewController = {
        return storyboard!.instantiateViewController(identifier: "DailyViewController")
    }()
    
    lazy var weeklyViewController: WeeklyViewController = {
        return storyboard!.instantiateViewController(identifier: "WeeklyViewController")
    }()
    
    var managedControllers: [UIViewController] {
        return [DailyViewController, weeklyViewController]
    }
    
    
    
    //Properties
    let locationManager = CLLocationManager()
    var currentApperance: Appearance = .daily
    
    
    
    //LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestLocation()
        
        updateCurrentController(animated: false)
    }
    //Functions
    func updateCurrentController(animated: Bool) {
        switch currentApperance {
        case .daily:
            setViewControllers([DailyViewController], direction: .reverse, animated: animated, completion: nil)
        case .weekly:
            setViewControllers([weeklyViewController], direction: .forward, animated: animated, completion: nil)
        }
    }
        
    //Actions
    @IBAction func segmentedControlValueChanged(_ sender: Any) {
        if let newApperance = Appearance(rawValue: segmentedControl.selectedSegmentIndex) {
            currentApperance = newApperance
            updateCurrentController(animated: true)
        }
    }
}
extension WeatherPageViewController: CLLocationManagerDelegate {
    
    //Functions
    private func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Uygulamanın konum servislerini kullanma yetkisi yok.")
        case .denied:
            print("Kullanıcı, uygulama için konum servislerinin kullanımını reddetti veya Ayarlar'da genel olarak devre dışı bırakıldı.")
        case .authorizedAlways:
            print("Kullanıcı, istediği zaman konum hizmetini başlatması için uygulamaya izin verdi.")
        case .authorizedWhenInUse:
            print("Kullanıcı, uygulamadayken konum servislerini başlatmasına izi verdi.")
        @unknown default:
            fatalError()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let myCoordinate = locations.first?.coordinate {
            let weatherProvider = WeatherProvider()
            
            weatherProvider.getWeather(for: myCoordinate) { (weather) in
                guard let weather = weather else { return }
                
                self.DailyViewController.updateUI(with: weather)
                self.weeklyViewController.weather = weather
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}


