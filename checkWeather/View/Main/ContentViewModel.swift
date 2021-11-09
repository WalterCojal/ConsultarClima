//
//  ContentViewModel.swift
//  checkWeather
//
//  Created by Walter Santiago Cojal Medina on 7/11/21.
//

import Foundation
import RxSwift

protocol ContentViewModelProtocol {
    var interactor: WeatherInteractorProtocol { get }
    var disposeBag: DisposeBag { set get }
    
    func getWeather(of city: String) -> Observable<WeatherResponse>
}

struct ContentViewModel: ContentViewModelProtocol {
    
    var interactor: WeatherInteractorProtocol = WeatherInteractor()
    
    var disposeBag: DisposeBag = DisposeBag()
    
    func getWeather(of city: String) -> Observable<WeatherResponse> {
        return interactor.getWeather(from: city)
    }
    
}
