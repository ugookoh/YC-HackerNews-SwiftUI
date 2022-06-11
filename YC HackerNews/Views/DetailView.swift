//
//  DetailView.swift
//  YC HackerNews
//
//  Created by Ugo Okoh on 2022-06-10.
//

import SwiftUI
import WebKit

struct DetailView: View {
  let url: String?
  var body: some View {
    ZStack {
      Color(UIColor.black)
        .edgesIgnoringSafeArea(.all)
      WebView(urlString: self.url)
        .edgesIgnoringSafeArea(.bottom)
    }
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(url: "www.google.ca")
  }
}
