//
//  ViewModelProtocol.swift
//  checkWeather
//
//  Created by Walter Santiago Cojal Medina on 8/11/21.
//

import Foundation
import RxSwift

protocol ViewModelProtocol {
    var apiClient: APIClient { set get }
    var dispose: DisposeBag { set get }
}
