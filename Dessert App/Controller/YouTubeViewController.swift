

import UIKit
import youtube_ios_player_helper

class YouTubeViewController: UIViewController, YTPlayerViewDelegate{

    var myVideoURL : URL?
    @IBOutlet weak var playerView: YTPlayerView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        playerView.delegate = self
        let videoSTR        = myVideoURL?.absoluteString
        let arr             = videoSTR?.components(separatedBy: "=")
        let videoID         = arr?[1]
        playerView.load(withVideoId: videoID ?? "")
    }
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
}
