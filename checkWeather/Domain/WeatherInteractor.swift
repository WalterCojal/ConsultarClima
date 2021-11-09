//
//  WeatherInteractor.swift
//  checkWeather
//
//  Created by Walter Santiago Cojal Medina on 9/11/21.
//

import Foundation
import RxSwift

protocol WeatherInteractorProtocol {
    var weatherRepository: WeatherRepositoryProtocol { get }
    
    func getWeather(from city: String) -> Observable<WeatherResponse>
}

struct WeatherInteractor: WeatherInteractorProtocol {
    
    var weatherRepository: WeatherRepositoryProtocol = WeatherRepository()
    
    func getWeather(from city: String) -> Observable<WeatherResponse> {
        return weatherRepository.getWeather(from: city)
    }
    
}
