//
//  Weather.swift
//  checkWeather
//
//  Created by Walter Santiago Cojal Medina on 7/11/21.
//

import Foundation
import CoreLocation
import MapKit

struct WeatherResponse: Codable {
    var coord: Coordinate = Coordinate(lon: -77.0281, lat: -12.043)
    var weather: [Weather] = []
    var base: String = ""
    var main: MainWeather = MainWeather()
    var visibility: Double = 0.0
    var wind: Wind = Wind()
    var clouds: Cloud = Cloud()
    var dt: Int32 = 0
    var sys: Sys = Sys()
    var timezone: Double = 0.0
    var id: Int = 0
    var name: String = "Clima"
    var cod: Int = 0
    
    func getPointAnnotation() -> MKPointAnnotation {
        let mark = MKPointAnnotation()
        mark.coordinate = coord.getCCLocation2D()
        mark.title = name
        mark.subtitle = "Temperatura: \(main.temp.F2C()) °C"
        return mark
    }
    
    func getWeatherInfo() -> String {
        return """
            Temperatura: \(main.temp.F2C()) °C
            Presión: \(Int(main.pressure)) Pa
            Humedad: \(Int(main.humidity)) %
        """
    }
    
}

struct Coordinate: Codable {
    var lon: Double
    var lat: Double
    
    func getCCLocation2D() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
}

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct MainWeather: Codable {
    var temp: Double = 0.0
    var feels_like: Double = 0.0
    var temp_min: Double = 0.0
    var temp_max: Double = 0.0
    var pressure: Double = 0.0
    var humidity: Double = 0.0
    var sea_level: Double? = 0.0
    var grnd_level: Double? = 0.0
}

struct Wind: Codable {
    var speed: Double = 0.0
    var deg: Double = 0.0
    var gust: Double? = 0.0
}

struct Cloud: Codable {
    var all: Double = 0.0
}

struct Sys: Codable {
    var type: Int? = 0
    var id: Int? = 0
    var country: String = ""
    var sunrise: Int32 = 0
    var sunset: Int32 = 0
}
