//
//  InsideGalleryView.swift
//  Africa
//
//  Created by realxnesia on 28/07/23.
//

import SwiftUI

struct InsideGalleryView: View {
  let animal: AnimalModel
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center) {
        ForEach(animal.gallery, id: \.self) { item in
          Image(item)
            .resizable()
            .scaledToFit()
            .frame(height: 200)
          .cornerRadius(12)
        }
      }
    }
  }
}

struct InsideGalleryView_Previews: PreviewProvider {
  static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
  static var previews: some View {
    InsideGalleryView(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
