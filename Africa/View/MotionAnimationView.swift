//
//  MotionAnimationView.swift
//  Africa
//
//  Created by realxnesia on 30/08/23.
//

import SwiftUI

struct MotionAnimationView: View {
  @State private var randomCircle = Int.random(in: 12...16)
  @State private var isAnimating = false
  
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        ForEach(0...randomCircle, id: \.self) { item in
          Circle()
            .foregroundColor(.gray)
            .opacity(0.15)
            .frame(width: randomSize(), height: randomSize(), alignment: .center)
            .scaleEffect(isAnimating ? randomScale() : 1)
            .position(
              x: randomCoordinate(max: geometry.size.width),
              y: randomCoordinate(max: geometry.size.height)
            )
            .animation(
              Animation.interpolatingSpring(
                stiffness: 0.5, damping: 0.5
              )
              .repeatForever()
              .speed(randomSpeed())
              .delay(randomDelay())
            )
            .onAppear {
              isAnimating = true
            }
        } //: LOOP
      } //: ZSTACK
      .drawingGroup() // prevent slow rendering
    } //: GEOMETRY
  }
  
  // MARK: - FUNCTIONS
  // 1. RANDOM COORDINATE
  private func randomCoordinate(max: CGFloat) -> CGFloat {
    return CGFloat.random(in: 0...max)
  }
  // 2. RANDOM SIZE
  private func randomSize() -> CGFloat {
    return CGFloat(Int.random(in: 10...300))
  }
  // 3. RANDOM SCALE
  private func randomScale() -> CGFloat {
    return CGFloat(Double.random(in: 0.1...2.0))
  }
  // 4. RANDOM SPEED
  private func randomSpeed() -> Double {
    return Double.random(in: 0.025...1.0)
  }
  // 5. RANDOM DELAY
  private func randomDelay() -> Double {
    return Double.random(in: 0...2)
  }
}

struct MotionAnimationView_Previews: PreviewProvider {
  static var previews: some View {
    MotionAnimationView()
  }
}

// note: by default geometry reader refrence ke size width dan height dari screen. geometry.size.height / 2
// but once kita menggunakan customview, maka orign viewnya berubah dari center ke top left.
