//
//  MapView.swift
//  Africa
//
//  Created by realxnesia on 20/07/23.
//

import SwiftUI
import MapKit

struct MapView: View {
  let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
  
  @State private var region: MKCoordinateRegion = { // Closure
    var mapCoordinates = CLLocationCoordinate2D(
      latitude: 6.600286,
      longitude: 16.4377599
    )
    var mapZoomLevel = MKCoordinateSpan(
      latitudeDelta: 70.0,
      longitudeDelta: 70.0
    )
    var mapRegion = MKCoordinateRegion(
      center: mapCoordinates,
      span: mapZoomLevel
    )
    return mapRegion
  }()
  
  @State private var region2: MKCoordinateRegion = {
    var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
    var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
    
    return mapRegion
  }()
  
  var body: some View {
    // MARK: - 1. BASIC MAP
//    Map(coordinateRegion: $region2)
    
    // MARK: - 2. ADVANCED MAP
    Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {
      item in
      // (A) Pin: Old style (always static) - DEPRECATED
      // MapPin(coordinate: item.location, tint: .accentColor)
      
      // (B) Marker: New Style (always static)
      // MapMarker(coordinate: item.location, tint: .accentColor)
      
      // (C) Custom Basic Annotation (it could be interactive)
      // MapAnnotation(coordinate: item.location) {
      //   Image("logo")
      //     .resizable()
      //     .scaledToFit()
      //     .frame(width: 32, height: 32, alignment: .center)
      // }
      
      // (D) Custom advanced annotation
      MapAnnotation(coordinate: item.location) {
        MapAnnotationView(location: item)
      }
    }) //: MAP
    .overlay (
      HStack(alignment: .center, spacing: 12) {
        Image("compass")
          .resizable()
          .scaledToFit()
          .frame(width: 48, height: 48, alignment: .center)
        
        VStack(alignment: .leading, spacing: 3) {
          HStack {
            Text("Latitude :")
              .font(.footnote)
              .fontWeight(.bold)
              .foregroundColor(.accentColor)
            Spacer()
            Text("\(region.center.latitude)")
              .font(.footnote)
              .fontWeight(.bold)
              .foregroundColor(.white)
          }
          Divider()
          HStack {
            Text("Longitude :")
              .font(.footnote)
              .fontWeight(.bold)
              .foregroundColor(.accentColor)
            Spacer()
            Text("\(region.center.longitude)")
              .font(.footnote)
              .fontWeight(.bold)
              .foregroundColor(.white)
          }
        }
      }
      .padding(.vertical, 12)
      .padding(.horizontal, 12)
      .background(
        Color.black
          .cornerRadius(8)
          .opacity(0.6)
      )
      .padding()
      , alignment: .top
    )
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
