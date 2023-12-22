//
//  WeatherButton.swift
//  SwiftUI-WeatherApp
//
//  Created by Alex Quiton on 12/21/23.
//

import SwiftUI
struct WeatherButton: View{
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View{
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundStyle(textColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}

struct WeatherButtonPreviews: PreviewProvider{
    static var previews: some View{
        WeatherButton(title: "testButton", textColor: .white, backgroundColor: .mint)
    }
}
