//
//  VideoListView.swift
//  Africa
//
//  Created by realxnesia on 20/07/23.
//

import SwiftUI

struct VideoListView: View {
  @State var videos: [VideoModel] = Bundle.main.decode("videos.json")
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium) // HAPTIC Feedback
  
  var body: some View {
    NavigationView {
      List {
        ForEach(videos) { video in
          NavigationLink(
            destination: VideoPlayerView(
              videoSelected: video.id,
              videoTitle: video.name
            )
          ) {
            renderVideoListItemView(video: video)
          }
        } //: LOOP
      } //: LIST
      .listStyle(InsetGroupedListStyle()) // Membuat warna background menjadi abu2 dan memiliki corner radius
      .navigationBarTitleDisplayMode(.inline)
      .navigationTitle("Videos")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            videos.shuffle()
            hapticImpact.impactOccurred()
          } label: {
            Image(systemName: "arrow.2.squarepath")
          }
        }
      }
    } //: NAVIGATION VIEW
  }
  
  private func renderVideoListItemView(video: VideoModel) -> some View {
    VideoListItemView(video: video)
      .padding(.vertical, 8)
  }
}

struct VideoListView_Previews: PreviewProvider {
  static var previews: some View {
    VideoListView()
  }
}
