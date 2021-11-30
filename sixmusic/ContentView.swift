//
//  ContentView.swift
//  sixmusic
//
//  Created by Chris Richards on 19/06/2020.
//  Copyright © 2020 Yellow Feather Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        VStack {
            TrackView()
            Spacer()
            TransportControlsView()
            Spacer()
            VolumeControlView()
        }.padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
