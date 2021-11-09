//
//  WeatherRequest.swift
//  checkWeather
//
//  Created by Walter Santiago Cojal Medina on 7/11/21.
//

import Foundation

struct WeatherRequest: APIRequest {
    
    var method: RequestType = .GET
    
    var path: String = "weather"
    
    var parameters: [String : String] = [:]
    
    init(city: String) {
        parameters["appid"] = "af110f4b1f645e4342aa760ce2cb16c7"
        parameters["q"] = city
    }
    
}
