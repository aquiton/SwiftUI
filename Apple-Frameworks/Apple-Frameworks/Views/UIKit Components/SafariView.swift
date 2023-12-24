//
//  SafariView.swift
//  Apple-Frameworks
//
//  Created by Alex Quiton on 12/23/23.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable{
    
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context:  UIViewControllerRepresentableContext<SafariView>) {}
}

//Video 3:12:12
