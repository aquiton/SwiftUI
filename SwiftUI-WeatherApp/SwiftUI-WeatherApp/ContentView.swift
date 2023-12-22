//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Alex Quiton on 12/21/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack{
                CityTextView(cityName: "Grand Rapids, MI")
                MainWeatherStatusView(weatherIcon: isNight ? "moon.stars.fill": "cloud.sun.fill", temp: 72)
                
                HStack(spacing: 25){
                   WeatherDayView(dayOfWeek: "TUE",
                                  imageName: "cloud.sun.fill",
                                  temperature: 79)
                   WeatherDayView(dayOfWeek: "WED", 
                                  imageName: "sun.max.fill",
                                  temperature: 85)
                   WeatherDayView(dayOfWeek: "THU", 
                                  imageName: "cloud.fill",
                                  temperature: 70)
                   WeatherDayView(dayOfWeek: "FRI", 
                                  imageName: "cloud.sun.rain.fill",
                                  temperature: 49)
                   WeatherDayView(dayOfWeek: "SAT", 
                                  imageName: "sun.max.fill",
                                  temperature: 99)
                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                Spacer()
                    
            }
        }
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View{
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack(spacing: 5){
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
    
}

struct BackgroundView: View{
    var isNight: Bool
  
    var body: some View{
        LinearGradient(colors: [isNight ? .black : .blue,
                                isNight ? .gray : Color("lightBlue")],
                       startPoint: .topLeading,
                       endPoint:.bottomTrailing).ignoresSafeArea(edges: .all)
    }
}

struct CityTextView: View{
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View{
    var weatherIcon: String
    var temp: Int
    var body: some View{
        VStack(spacing: 10){
            Image(systemName: weatherIcon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }.padding(.bottom, 50)
    }
}


