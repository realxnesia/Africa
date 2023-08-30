//
//  GalleryView.swift
//  Africa
//
//  Created by realxnesia on 20/07/23.
//

import SwiftUI

struct GalleryView: View {
  let animals: [AnimalModel] = Bundle.main.decode("animals.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  
  @State private var selectedAnimal: String = "lion"
  
  // MARK: - SIMPLE GRID DEFINITION
  /*
  let gridLayout: [GridItem] = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible()),
  ]
  */
  
  // MARK: - EFFICIENT GRID DEFINITION
  /*
  let gridLayout: [GridItem] = Array(
    repeating: GridItem(.flexible()),
    count: 3
  )
  */
  
  // MARK: - DYNAMIC GRID LAYOUT
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Double = 3.0
  
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack {
        // MARK: - SELECTED IMAGE
        Image(selectedAnimal)
          .resizable()
          .scaledToFit()
          .clipShape(Circle())
          .overlay(
            Circle().stroke(Color.white, lineWidth: 1)
          )
        
        // MARK: - SLIDER
        Slider(value: $gridColumn, in: 2...4, step: 1)
          .padding(.horizontal)
          .onChange(of: gridColumn, perform: { value in
            gridSwitch()
          })
        
        // MARK: - GRID
        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
          ForEach(animals) { animal in
            Image(animal.image)
              .resizable()
              .scaledToFit()
              .clipShape(Circle())
              .overlay(
                Circle().stroke(
                  Color.white, lineWidth: 1
                )
              )
              .onTapGesture {
                selectedAnimal = animal.image
                haptics.impactOccurred()
              }
          } //: LOOP
        } //: GRID
        .animation(.easeIn)
        .onAppear {
          gridSwitch()
        }
      } //: VSTACK
      .padding(.horizontal, 10)
      .padding(.vertical, 50)
    } //: SCROLL
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(MotionAnimationView())
  }
  
  private func gridSwitch() {
    gridLayout = Array(
      repeating: .init(.flexible()),
      count: Int(gridColumn)
    )
  }
}

struct GalleryView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryView()
  }
}
