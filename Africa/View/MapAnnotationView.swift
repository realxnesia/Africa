//
//  MapAnnotationView.swift
//  Africa
//
//  Created by realxnesia on 30/08/23.
//

import SwiftUI

struct MapAnnotationView: View {
  var location: NationalParkLocation
  @State private var animation: Double = 0.0
  
  var body: some View {
    ZStack {
      // MARK: - View Circle
      Circle()
        .fill(Color.accentColor)
        .frame(width: 54, height: 54, alignment: .center)
      
      // MARK: - Border Circle with Animation
      Circle()
        .stroke(Color.accentColor, lineWidth: 2)
        .frame(width: 52, height: 52, alignment: .center)
        .scaleEffect(1 + CGFloat(animation))
        .opacity(1 - animation)
      
      Image(location.image)
        .resizable()
        .scaledToFit()
        .frame(width: 48, height: 48, alignment: .center)
        .clipShape(Circle())
    }
    .onAppear {
      withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
        animation = 1
        // setelah 2s animation memulai lagi dan start dari initial value
      }
    }
  }
}

struct MapAnnotationView_Previews: PreviewProvider {
  // MARK: - Sample Data
  static var locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
  static var previews: some View {
    MapAnnotationView(location: locations[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
