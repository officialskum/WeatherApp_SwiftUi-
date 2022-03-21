//
//  ContentView.swift
//  SwiftUI-WeatherTestApp
//
//  Created by Yolanda Jonasson on 2022-01-24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue,
                           bottomColor: isNight ? .gray : Color("lightBlue"))
            VStack{
                CityTextView(cityName: isNight ? "Stockholm, Nighttime" : "Stockholm, Sweden")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 76)
                
                HStack(spacing: 30){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: isNight ? "moon.stars.fill" :  "cloud.sun.fill",
                                   temperature: "74")
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: "88")
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: "54")
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: "60")
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temperature: "25")
                }
                Spacer()
 
                Button{
                    isNight.toggle()
                    print("tapped")
                } label:{
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
            .previewDevice("iPhone 12 Pro Max")
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: String
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)º")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
        
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    var body: some View{
        
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
        
    }
    
}

struct MainWeatherStatusView: View{
    
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack(spacing: 10){
        Image(systemName: "cloud.sun.fill")
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
        
        Text("\(temperature)º")
            .font(.system(size: 70, weight: .medium))
            .foregroundColor(.white)
    }
    .padding(.bottom, 40)
        
    }
  
}
