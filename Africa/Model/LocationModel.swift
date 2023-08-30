//
//  LocationModel.swift
//  Africa
//
//  Created by realxnesia on 29/08/23.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
  var id: String
  var name: String
  var image: String
  var latitude: Double
  var longitude: Double
}

extension NationalParkLocation {
  // Computed Property
  var location: CLLocationCoordinate2D {
    CLLocationCoordinate2D(
      latitude: latitude,
      longitude: longitude
    )
  }
}
