//
//  ProgressView.swift
//  checkWeather
//
//  Created by Walter Santiago Cojal Medina on 8/11/21.
//

import SwiftUI

struct LoaderView: View {
    
    var tintColor: Color = .green
    var scaleSize: CGFloat = 2.0
    
    var body: some View {
        ProgressView()
            .scaleEffect(scaleSize, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
