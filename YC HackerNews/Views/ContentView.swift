//
//  ContentView.swift
//  YC HackerNews
//
//  Created by Ugo Okoh on 2022-06-10.
//

import SwiftUI

struct ContentView: View {
  @State var isActive = true
  var body: some View {
    ZStack {
      Color(.black)
        .edgesIgnoringSafeArea(.all)
      if self.isActive {
        VStack {
          Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 140)
        }
      } else {
        MainView()
      }

    }.onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
        withAnimation {
          self.isActive = false
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
