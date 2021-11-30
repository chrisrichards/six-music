//
//  ControlsView.swift
//  sixmusic
//
//  Created by Chris Richards on 19/06/2020.
//  Copyright © 2020 Yellow Feather Ltd. All rights reserved.
//

import SwiftUI

struct TransportControlsView: View {
    var player: Player = Player()
    @State private var isPlaying: Bool = false

    var body: some View {
        HStack {
            Spacer()
            Image(nsImage: NSImage(named: "NSRewindTemplate")!)
                .font(.system(size: 32))
            Spacer()
            Button(action: { self.togglePlay() }) {
                Image(systemName: self.isPlaying ? "pause.fill" : "play.fill")
                    .font(.system(size: 32))
            }
                .buttonStyle(PlainButtonStyle())
            Spacer()
            Image(nsImage: NSImage(named: "NSFastForwardTemplate")!)
                .font(.system(size: 32))
            Spacer()
        }
    }
        
    func togglePlay() {
        if (self.isPlaying) {
            self.player.pause()
            self.isPlaying = false
        }
        else {
            self.player.play()
            self.isPlaying = true
        }
    }
}

struct TransportControlsView_Previews: PreviewProvider {
    static var previews: some View {
        TransportControlsView()
    }
}
