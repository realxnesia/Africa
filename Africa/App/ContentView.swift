//
//  ContentView.swift
//  Africa
//
//  Created by realxnesia on 20/07/23.
//

import SwiftUI

struct ContentView: View {
  let animals: [AnimalModel] = Bundle.main.decode("animals.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  
  @State private var isGridViewActive: Bool = false
  
//  let gridLayout: [GridItem] = Array(
//    repeating: GridItem(.flexible()),
//    count: 2
//  )
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Int = 1
  @State private var toolbarIcon: String = "square.grid.2x2"
  
  var body: some View {
    NavigationView {
      Group {
        if isGridViewActive {
          ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
              ForEach(animals) { animal in
                NavigationLink(
                  destination: AnimalDetailView(animal: animal)) {
                    AnimalGridItemView(animal: animal)
                  }
              } //: LOOP
            } //: VGRID
            .padding(10)
            .animation(.easeIn)
          } //: SCROLLVIEW
        } else {
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
              NavigationLink(destination: AnimalDetailView(animal: animal)) {
                AnimalListItemView(animal: animal)
              }
            } //: LOOP
            CreditsView()
              .modifier(CenterModifier()) // kita pakai ini karena by default, List View memiliki default preferences. karena terdapat bug kita gunakan ini
              
          } //: LIST
        }
      }
      .navigationTitle("Africa")
      .navigationBarTitleDisplayMode(.large)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          HStack(spacing: 16) {
            // MARK: - BUTTON LIST VIEW
            Button {
              print("list-view-is-activated")
              isGridViewActive = false
              haptics.impactOccurred()
            } label: {
              Image(systemName: "square.fill.text.grid.1x2")
                .font(.title2)
                .foregroundColor(
                  isGridViewActive
                  ? .primary
                  : .accentColor
                )
            } //: BUTTON
            
            //MARK: - BUTTON GRID VIEW
            Button {
              print("grid-view-is-activated")
              isGridViewActive = true
              haptics.impactOccurred()
              gridSwitch()
            } label: {
              Image(systemName: toolbarIcon)
                .font(.title2)
                .foregroundColor(
                  isGridViewActive
                  ? .accentColor
                  : .primary
                )
            }
          } //: HSTACK
        } //: TOOLBAR ITEM
      } //: TOOLBAR
    }
  }
  
  // MARK: - FUNCTIONS
  private func gridSwitch() {
    gridLayout = Array(
      repeating: .init(.flexible()),
      count: gridLayout.count % 3 + 1
    )
    gridColumn = gridLayout.count
    print("[*] Grid Number: \(gridColumn)")
    // note: when a < b then a % b equals a
    changeGridImage()
  }
  
  private func changeGridImage() {
    switch gridColumn {
    case 1:
      toolbarIcon = "square.grid.2x2"
    case 2:
      toolbarIcon = "square.grid.3x2"
    case 3:
      toolbarIcon = "rectangle.grid.1x2"
    default:
      toolbarIcon = "square.grid.2x2"
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
