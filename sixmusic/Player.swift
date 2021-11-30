//
//  Player.swift
//  sixmusic
//
//  Created by Chris Richards on 30/11/2021.
//  Copyright © 2021 Yellow Feather Ltd. All rights reserved.
//

import Foundation
import AVFoundation

class Player
{
    var streamId: String = "bbc_6music"
    var player: AVPlayer!

    func play() {
        // "https://as-dash-uk-live.akamaized.net/pool_6/live/bbc_6music/bbc_6music.isml/dash/bbc_6music-audio=96000-237822062.m4s"
        // let urlString = "http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/\(currentStation.id).m3u8"

        let urlString = "https://open.live.bbc.co.uk/mediaselector/5/select/mediaset/http-icy-mp3-a/vpid/\(self.streamId)/format/pls.pls"
        let url = URL(string:urlString)
        self.player = AVPlayer(url:url!)
        self.player.play()
    }
    
    func pause() {
        self.player.pause()
    }

}
