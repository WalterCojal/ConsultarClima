//
//  ContentView.swift
//  checkWeather
//
//  Created by Walter Santiago Cojal Medina on 6/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var city: String = ""
    @State var loading: Bool = false
    @State var showMessage: Bool = false
    @State var showMapPage: Bool = false
    @State var weather: WeatherResponse = WeatherResponse()
    let viewModel: ContentViewModelProtocol
    
    init () {
        viewModel = ContentViewModel()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: CityView(weatherResponse: weather), isActive: $showMapPage) {
                        EmptyView()
                    }
                LoaderView().hidden(!loading)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                Text("Ingrese el nombre de una ciudad y pulse el botón para obtener su información del clima")
                HStack {
                    TextField("Ciudad", text: $city)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    Button {
                        self.getWeather()
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .tint(.black)
                            .padding()
                    }.alert(isPresented: $showMessage) {
                        Alert(title: Text("Intente de nuevo"),
                                message: Text(""))
                    }
                }
            }
            .navigationTitle("Clima")
        }.padding()
    }
    
    private func getWeather() {
        loading = true
        viewModel.getWeather(of: self.city).subscribe { result in
            loading = false
            weather = result
            showMapPage = true
        } onError: { error in
            loading = false
            showMessage = true
        }.disposed(by: viewModel.disposeBag)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
