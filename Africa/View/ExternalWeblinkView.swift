//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by realxnesia on 28/07/23.
//

import SwiftUI

struct ExternalWeblinkView: View {
  let animal: AnimalModel
  var body: some View {
    GroupBox {
      HStack {
        Image(systemName: "globe")
        Text("Wikipedia")
        Spacer()
        Group {
          Image(systemName: "arrow.up.right.square")
          Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "htrtps://wikipedia.org")!)
        }
        .foregroundColor(.accentColor)
      }
    }
  }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
  static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
  static var previews: some View {
    ExternalWeblinkView(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
