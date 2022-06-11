//
//  MainView.swift
//  YC HackerNews
//
//  Created by Ugo Okoh on 2022-06-10.
//

import SwiftUI

struct MainView: View {
  init() {
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    UINavigationBar.appearance().barTintColor = UIColor.black
    UITableView.appearance().backgroundColor = UIColor.black
    UITableViewCell.appearance().backgroundColor = UIColor.black
  }
  @ObservedObject var networkManager = NetworkManager()

  var body: some View {
    NavigationView {
      ZStack {
        List(networkManager.posts) { post in
          ZStack {
            NavigationLink(destination: DetailView(url: post.url)) {
              EmptyView()
            }
            HStack {
              Text(String(post.points))
                .foregroundColor(.white)
                .font(.system(size: 15))
                .fontWeight(.bold)
                .frame(width: 50, alignment: .leading)

              Text(post.title)
                .foregroundColor(.white)
              Spacer()
              Image(systemName: "chevron.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 10)
                .foregroundColor(.white)
                .padding([.leading], 10)
            }
          }

          .listRowBackground(Color.black)
        }
      }
      .navigationBarTitle("YC HackerNews")
    }
    .onAppear {
      networkManager.fetchData()
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
      .previewInterfaceOrientation(.portrait)
  }
}