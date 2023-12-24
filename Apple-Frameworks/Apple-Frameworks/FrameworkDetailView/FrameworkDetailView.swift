//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Alex Quiton on 12/22/23.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack{
            
            DetailXButtonView(isShowingDetailView: $isShowingDetailView)
            Spacer()
            
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .padding()
                .font(.body)
            
            Spacer()
            
            Button {
                isShowingSafariView = true
                
            } label: {
                AFButton(title: "Learn More!")
            }
            .fullScreenCover(isPresented: $isShowingSafariView, content: {
                SafariView(url: URL(string: framework.urlString) ?? URL(string: "apple.com")!)
                //?? -> is if the url or any case is nil and will result to in our case the apple.com and is unwrapped
            })
        }
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
        .preferredColorScheme(.dark)
}
