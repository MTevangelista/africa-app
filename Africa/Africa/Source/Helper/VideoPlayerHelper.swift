import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat)
    guard url != nil else { return videoPlayer! }
    videoPlayer = AVPlayer(url: url!)
    videoPlayer?.play()
    return videoPlayer!
}
