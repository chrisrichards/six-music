//
//  TrackView.swift
//  sixmusic
//
//  Created by Chris Richards on 19/06/2020.
//  Copyright © 2020 Yellow Feather Ltd. All rights reserved.
//

import SwiftUI
import Kingfisher

struct TrackView: View {
    @StateObject var dataStore = NowPlayingDataStore()
    
    let imageSize: CGSize
    let processor: ImageProcessor

    init() {
        self.imageSize = CGSize(width: 320, height: 320)
        self.processor = DownsamplingImageProcessor(size: imageSize)
    }
    
    var body: some View {
        VStack {
            KFImage(dataStore.nowPlaying.imageUrl)
                .setProcessor(processor)
                .fade(duration: 0.25)
                .foregroundColor(Color(.systemGray))
                .cornerRadius(20)
                .frame(width: self.imageSize.width, height: self.imageSize.height)
            
            Spacer()
            
            HStack {
                VStack(alignment: .leading) {
                    Text(dataStore.nowPlaying.track)
                        .font(.title)
                        .fontWeight(.semibold)
                    Text(dataStore.nowPlaying.artist)
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            
            Spacer()
            
            VStack {
                Rectangle()
                .frame(height: 3)
                .cornerRadius(3)
                .foregroundColor(Color(.systemGray))
                
                HStack {
                    Text("0:00")
                    .font(.caption)
                    .foregroundColor(Color(.tertiaryLabelColor))
                    Spacer()
                    Text("4:00")
                        .font(.caption)
                        .foregroundColor(Color(.tertiaryLabelColor))
                }
            }
        }
    }
}

struct TrackView_Previews: PreviewProvider {
    static var previews: some View {
        TrackView()
    }
}
