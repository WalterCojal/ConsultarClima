//
//  Extension.swift
//  checkWeather
//
//  Created by Walter Santiago Cojal Medina on 8/11/21.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}

extension Data {
    func printData() {
        guard let objcet = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: objcet, options: [.prettyPrinted]),
            let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        else { return }
        print(prettyPrintedString)
    }
}

extension Double {
    func F2C() -> Int {
        return Int((self - 273.15).rounded())
    }
}
