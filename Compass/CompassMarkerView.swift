//
//  CompassMarkerView.swift
//  Compass
//
//  Created by Anderson Sprenger on 02/09/21.
//  Layout: https://medium.com/flawless-app-stories/build-a-compass-app-with-swiftui-f9b7faa78098
//

import SwiftUI

struct CompassMarkerView: View {
    let marker: Marker
    let compassDegrees: Double
    
    private var capsuleWidth: CGFloat {
        marker.degrees == 0 ? 7 : 3
    }
    
    private var capsuleHeight: CGFloat {
        marker.degrees == 0 ? 45 : 30
    }
    
    private var capsuleColor: Color {
        marker.degrees == 0 ? .red : .gray
    }
    
    private var textAngle: Angle {
        Angle(degrees: -compassDegrees - marker.degrees)
    }
    
    var body: some View {
        VStack {
            Text(marker.degreeText())
                .fontWeight(.light)
                .rotationEffect(textAngle)
            
            Capsule()
                .frame(width: capsuleWidth, height: capsuleHeight)
                .foregroundColor(capsuleColor)
            
            Text(marker.label)
                .fontWeight(.bold)
                .rotationEffect(textAngle)
                .padding(.bottom, 80)
            
            Spacer(minLength: 120)
        }
        .rotationEffect(Angle(degrees: marker.degrees))
    }
}

struct CompassMarkerView_Previews: PreviewProvider {
    static var previews: some View {
        CompassMarkerView(marker: Marker.markers()[0], compassDegrees: 0.0)
            .previewLayout(.fixed(width: 200, height: 300))
    }
}
