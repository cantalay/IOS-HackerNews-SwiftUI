//
//  DetailView.swift
//  HackerNews-SwiftUI
//
//  Created by Can Talay on 17.12.2019.
//  Copyright © 2019 Can Talay. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}


