//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Alex Quiton on 12/22/23.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: viewModel.columns, content: {
                    ForEach(MockData.frameworks){ framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                })
            }
            .navigationTitle("🍎 Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView){
                FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework,
                                    isShowingDetailView: $viewModel.isShowingDetailView)
            }
        }
            
     
    }
}

struct FrameworkGridView_Previews: PreviewProvider{
    static var previews: some View{
        FrameworkGridView().preferredColorScheme(.dark)
    }
}


