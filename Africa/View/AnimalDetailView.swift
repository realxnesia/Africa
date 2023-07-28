//
//  AnimalDetailView.swift
//  Africa
//
//  Created by realxnesia on 21/07/23.
//

import SwiftUI

struct AnimalDetailView: View {
  let animal: AnimalModel
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 20) {
        // MARK: HERO IMAGE
        Image(animal.image)
          .resizable()
          .scaledToFit()
        
        // MARK: TTILE
        Text(animal.name.uppercased())
          .font(.largeTitle)
          .fontWeight(.heavy)
          .multilineTextAlignment(.center)
          .padding(.vertical, 8)
          .foregroundColor(.primary)
          .background( // orange background color with offset
            Color.accentColor
              .frame(height: 6)
              .offset(y: 24)
          )
        
        // MARK: HEADLINE
        Text(animal.headline)
          .font(.headline)
          .multilineTextAlignment(.leading)
          .foregroundColor(.accentColor)
          .padding(.horizontal)
        
        // MARK: GALLERY
        Group {
          HeadingView(headingImages: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
          InsideGalleryView(animal: animal)
        }
        .padding(.horizontal)
        
        
        // MARK: FACTS
        Group {
          HeadingView(headingImages: "questionmark.circle", headingText: "Did you know?")
          InsetFactView(animal: animal)
        }
        .padding(.horizontal)
        
        // MARK: DESCRIPTION
        Group {
          HeadingView(headingImages: "info.circle", headingText: "All about \(animal.name)")
          Text(animal.description)
            .multilineTextAlignment(.leading)
            .layoutPriority(1)
        }
        .padding(.horizontal)
        
        // MARK: MAP
        Group {
          HeadingView(headingImages: "map", headingText: "National Parks")
          InsetMapView()
        }
        .padding(.horizontal)
        
        // MARK: LINK
        Group {
          HeadingView(headingImages: "books.vertical", headingText: "Learn More")
          ExternalWeblinkView(animal: animal)
        }
        .padding(.horizontal)
        
      } //: VSTACK
      .navigationTitle("Learn about " + animal.name)
      .navigationBarTitleDisplayMode(.inline)
    } //: SCROLLVIEW
  }
}

struct AnimalDetailView_Previews: PreviewProvider {
  static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
  static var previews: some View {
    NavigationView { // dibuat agar kita dapat melihat preview-nya
      AnimalDetailView(animal: animals[0])
    }
  }
}
