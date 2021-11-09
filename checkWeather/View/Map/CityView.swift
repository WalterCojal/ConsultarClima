//
//  CityView.swift
//  checkWeather
//
//  Created by Walter Santiago Cojal Medina on 7/11/21.
//

import SwiftUI

struct CityView: View {
    
    var weatherResponse: WeatherResponse
    @State var showWeatherInfo = false
    
    var body: some View {
        MapView(
            centerCoordinate: .constant(weatherResponse.coord.getCCLocation2D()),
            point: weatherResponse.getPointAnnotation()
        )
            .ignoresSafeArea()
            .navigationBarTitle(weatherResponse.name, displayMode: .inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showWeatherInfo = true
                    }, label: {
                        Image(systemName: "thermometer")
                            .tint(.blue)
                    })
                    .alert(isPresented: $showWeatherInfo, content: {
                        Alert(
                            title: Text("Clime actual"),
                            message: Text(weatherResponse.getWeatherInfo())
                        )
                    })
                }
            })
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView(weatherResponse: WeatherResponse())
    }
}
