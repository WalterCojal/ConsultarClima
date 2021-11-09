//
//  APIClient.swift
//  checkWeather
//
//  Created by Walter Santiago Cojal Medina on 7/11/21.
//

import Foundation
import RxSwift

class APIClient {
    private let baseURL = URL(string: "http://api.openweathermap.org/data/2.5/")!

    func send<T: Codable>(apiRequest: APIRequest) -> Observable<T> {
        
        return Observable<T>.create { [unowned self] observer in
            let request = apiRequest.request(with: self.baseURL)
            print(request.url?.absoluteString ?? "")
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    data?.printData()
                    let model: T = try JSONDecoder().decode(T.self, from: data ?? Data())
                    observer.onNext(model)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }
    }
}
