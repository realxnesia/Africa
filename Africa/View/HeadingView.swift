//
//  HeadingView.swift
//  Africa
//
//  Created by realxnesia on 28/07/23.
//

import SwiftUI

struct HeadingView: View {
  var headingImages: String
  var headingText: String
  
    var body: some View {
      HStack {
        Image(headingImages)
          .foregroundColor(.accentColor)
          .imageScale(.large)
//          .resizable()
//          .frame(width: 30, height: 30)
        
        Text(headingText)
          .font(.title3)
          .fontWeight(.bold)
      }
      .padding(.vertical)
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
      HeadingView(
        headingImages: "photo.on.rectangle.angled",
        headingText: "Wilderness in Pictures"
      )
      .previewLayout(.sizeThatFits)
      .padding()
    }
}
