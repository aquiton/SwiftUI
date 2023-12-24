//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Alex Quiton on 12/24/23.
//

import SwiftUI

struct BarcodeScannerView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text("Not Yet Scanned")
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(.green)
                    .padding()
                
            }.navigationTitle("📷 Barcode Scanner")
        }
    }
}

#Preview {
    BarcodeScannerView()
}
