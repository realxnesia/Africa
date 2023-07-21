//
//  AnimalListItemView.swift
//  Africa
//
//  Created by realxnesia on 20/07/23.
//

import SwiftUI

struct AnimalListItemView: View {
  let animal: AnimalModel
  
  var body: some View {
    HStack(alignment: .center, spacing: 16) {
      Image(animal.image)
        .resizable()
        .scaledToFill()
        .frame(width: 90, height: 90)
        .clipShape(RoundedRectangle(cornerRadius: 12))
      
      VStack(alignment: .leading, spacing: 8) {
        Text(animal.name)
          .font(.title)
          .fontWeight(.heavy)
          .foregroundColor(.accentColor)
        
        Text(animal.headline)
          .font(.footnote)
          .multilineTextAlignment(.leading)
          .lineLimit(2) // maximum line length
          .padding(.trailing, 8)
      } //: VSTACK
    } //: HSTACK
  }
}

struct AnimalListItemView_Previews: PreviewProvider {
  static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
  static var previews: some View {
    AnimalListItemView(animal: animals[2])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
