//
//  DetailXButtonView.swift
//  Apple-Frameworks
//
//  Created by Alex Quiton on 12/24/23.
//

import SwiftUI

struct DetailXButtonView: View {
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
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
    }
}

#Preview {
    DetailXButtonView(isShowingDetailView: .constant(true))
}
