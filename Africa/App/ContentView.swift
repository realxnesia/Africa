//
//  ContentView.swift
//  Africa
//
//  Created by realxnesia on 20/07/23.
//

import SwiftUI

struct ContentView: View {
  let animals: [AnimalModel] = Bundle.main.decode("animals.json")
  
  var body: some View {
    NavigationView {
      List {
        CoverImageView()
          .frame(height: 300)
          .listRowInsets( // digunakan untuk menghapus spacer
            EdgeInsets(
              top: 0,
              leading: 0,
              bottom: 0,
              trailing: 0
            )
          )
        ForEach(animals) { animal in
          AnimalListItemView(animal: animal)
        }
      }
      .navigationTitle("Africa")
      .navigationBarTitleDisplayMode(.large)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
