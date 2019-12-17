//
//  WebView.swift
//  HackerNews-SwiftUI
//
//  Created by Can Talay on 17.12.2019.
//  Copyright © 2019 Can Talay. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
       
            if let safeString = urlString {
                if let url = URL(string: safeString) {
                    let request = URLRequest(url: url)
                    uiView.load(request)
            }
        }
    }
}
