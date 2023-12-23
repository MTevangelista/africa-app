import SwiftUI

struct VideoListView: View {
    let hapticImapact = UIImpactFeedbackGenerator(style: .medium)
    @State private var videos: [Video] = Bundle.main.decode("videos.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    let destination = VideoPlayerView(videoSelected: item.id, videoTitle: item.name)
                    NavigationLink(destination: destination) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
                }//: ForEach
            }//: List
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem( placement: .topBarTrailing) {
                    Button(action: shuffleVideos) {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }//: NavigationView
    }
    
    func shuffleVideos() {
        videos.shuffle()
        hapticImapact.impactOccurred()
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
