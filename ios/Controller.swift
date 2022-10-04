//
//  Controller.swift
//  healthAppTest
//
//  Created by Gustavo Dominguez on 04-10-22.
//

import Foundation
import HealthKit


@objc(Controller)
class Controller: NSObject {
let healthStore = HKHealthStore()

@objc
static func requiresMainQueueSetup() -> Bool {
   return true
  }
}
