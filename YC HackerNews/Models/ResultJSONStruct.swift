//
//  ResultJSONStruct.swift
//  YC HackerNews
//
//  Created by Ugo Okoh on 2022-06-10.
//

import Foundation

struct ResultJSONStruct: Decodable {
  let hits: [Post]
}

struct Post: Decodable, Identifiable {
  var id: String {
    return self.objectID
  }
  let title: String
  let objectID: String
  let url: String?
  let points: Int
}
