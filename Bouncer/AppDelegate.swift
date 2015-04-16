//
//  AppDelegate.swift
//  Bouncer
//
//  Created by Soojin Ro on 4/13/15.
//  Copyright (c) 2015 NSoojin. All rights reserved.
//

import UIKit
import CoreMotion

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    struct Motion {
        static let Manager = CMMotionManager()
    }
}

