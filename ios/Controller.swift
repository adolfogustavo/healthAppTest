//
//  Controller.swift
//  healthAppTest
//
//  Created by Gustavo Dominguez on 04-10-22.
//

import Foundation
import HealthKit
 
 // Swift Decorator to export Class to Objective-C
 // Declares Controller Class
@objc(Controller)
class Controller: NSObject {
  // Declares HealthKit store for our Project
 let healthStore = HKHealthStore()
 
  // Function Method to request Authorizations from Healthkit
 @objc
 func requestAuthorization() {
     let typesToShare: Set = [
         HKQuantityType.workoutType()
     ]
     let typesToRead: Set = [
         HKObjectType.workoutType(),
     ]
    
     // Request authorization for those quantity types.
     healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
         // Handle error.
     }
 }
  @objc
 static func requiresMainQueueSetup() -> Bool {
   return true
 }
}
