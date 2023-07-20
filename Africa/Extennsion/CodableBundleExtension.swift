//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by realxnesia on 20/07/23.
//

import Foundation

extension Bundle {
  func decode(_ file: String) -> [CoverImage] {
    // 1. Locate the json file
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Failed to locate \(file) in budle")
    }
    
    // 2. Create a proprety for the data
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load file from budle")
    }
    // 3. Create a decoder
    let decoder = JSONDecoder()
    
    // 4. Create property to decode data
    guard let loaded = try? decoder.decode([CoverImage].self, from: data) else {
      fatalError("Failed to decode \(file) in budle")
    }
    
    // 5. Return the radty to use data
    return loaded
  }
}
