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
      MapAnnotation(coordinate: item.location) {
        Image("logo")
          .resizable()
          .scaledToFit()
          .frame(width: 32, height: 32, alignment: .center)
      }
    })
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
