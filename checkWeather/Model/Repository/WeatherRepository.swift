//
//  WeatherRepository.swift
//  checkWeather
//
//  Created by Walter Santiago Cojal Medina on 9/11/21.
//

import Foundation
import RxSwift

protocol WeatherRepositoryProtocol {
    
    var apiClient: APIClient { get }
    
    func getWeather(from city: String) -> Observable<WeatherResponse>
    
}

struct WeatherRepository: WeatherRepositoryProtocol {
    
    var apiClient: APIClient = APIClient()
    
    func getWeather(from city: String) -> Observable<WeatherResponse> {
        let request = WeatherRequest(city: city)
        return apiClient.send(apiRequest: request)
    }
    
}
