//
//  WebView.swift
//  YC HackerNews
//
//  Created by Ugo Okoh on 2022-06-10.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
  let urlString: String?
  func makeUIView(context: Context) -> WKWebView {
    return WKWebView()
  }
  func updateUIView(_ uiView: WKWebView, context: Context) {
    if let safeUrlString = self.urlString {
      if let url = URL(string: safeUrlString) {
        let request = URLRequest(url: url)
        uiView.load(request)
      }
    }
  }
}
