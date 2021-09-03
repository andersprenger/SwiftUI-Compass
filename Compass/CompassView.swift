//
//  ContentView.swift
//  Compass
//
//  Created by Anderson Sprenger on 02/09/21.
//  Layout: https://medium.com/flawless-app-stories/build-a-compass-app-with-swiftui-f9b7faa78098
//

import SwiftUI
import CoreMotion

struct CompassView: View {
    @ObservedObject var compass = CompassLogic()
    
    var body: some View {
        VStack {
            Capsule()
                .frame(width: 5, height: 50)
            
            ZStack {
                ForEach(Marker.markers(), id: \.self) { marker in
                    CompassMarkerView(marker: marker, compassDegrees: compass.north)
                }
                .frame(width: 300, height: 300)
                .rotationEffect(Angle(degrees: compass.north))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CompassView()
    }
}
