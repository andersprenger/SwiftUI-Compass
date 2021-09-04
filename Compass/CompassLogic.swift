//
//  CompassHeading.swift
//  Compass
//
//  Created by Anderson Sprenger on 02/09/21.
//

import Foundation
import CoreMotion

class CompassLogic: ObservableObject {
    private let motionManager = CMMotionManager();
    private let updateRate: Double = 1/100
    private(set) var north: Double = .zero {
        didSet {
            objectWillChange.send()
        }
    }
    
    init() {
        motionManager.startDeviceMotionUpdates()
        
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = updateRate
            motionManager.startDeviceMotionUpdates(using: .xMagneticNorthZVertical, to: .main) { data, error in
                guard let validData = data else { fatalError("compass not avaliable") }
                
                self.north = -validData.heading
                print("N:", validData.heading)
            }
        }
    }
}
