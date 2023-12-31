//
//  CenterModifier.swift
//  Africa
//
//  Created by realxnesia on 30/08/23.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
