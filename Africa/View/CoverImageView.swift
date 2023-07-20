//
//  CoverImageView.swift
//  Africa
//
//  Created by realxnesia on 20/07/23.
//

import SwiftUI

struct CoverImageView: View {
  let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
  
    var body: some View {
      TabView {
        ForEach(coverImages) { item in
          Image(item.name)
            .resizable()
            .scaledToFill()
        } //: END OF LOOP
      } //: TABVIEW
      .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
        .previewLayout(.fixed(width: 400, height: 300))
    }
}
