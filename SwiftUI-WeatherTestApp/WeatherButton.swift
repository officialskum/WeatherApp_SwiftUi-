//
//  WeatherButton.swift
//  SwiftUI-WeatherTestApp
//
//  Created by Yolanda Jonasson on 2022-01-25.
//
import SwiftUI
import Foundation

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View{
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20,
                          weight: .bold,
                          design: .default))
            .cornerRadius(10)
        
    }
}
