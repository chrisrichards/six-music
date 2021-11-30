//
//  VolumeControlView.swift
//  sixmusic
//
//  Created by Chris Richards on 19/06/2020.
//  Copyright © 2020 Yellow Feather Ltd. All rights reserved.
//

import SwiftUI

struct VolumeControlView: View {
    @State var volume = 50.0
    
    var body: some View {
        HStack(spacing: 12) {
            Image(nsImage: NSImage(named: "NSAudioOutputVolumeOffTemplate")!)
            Slider(value: $volume, in: 0...100)
            Image(nsImage: NSImage(named: "NSAudioOutputVolumeHighTemplate")!)
        }
    }
}

struct VolumeControlView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeControlView(volume: 0)
    }
}
