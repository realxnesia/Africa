//
//  VideoModel.swift
//  Africa
//
//  Created by realxnesia on 18/08/23.
//

import Foundation

struct VideoModel: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
}

extension VideoModel {
  var thumbnail: String {
    "video-\(id)"
  }
}
