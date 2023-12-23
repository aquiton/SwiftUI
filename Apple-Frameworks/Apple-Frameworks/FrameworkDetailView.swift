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
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button{
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }.padding()
            }
          
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .padding()
                .font(.body)
            
            Spacer()
            
            Button {
                
            } label: {
                AFButton(title: "Learn More!")
            }
        }
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
