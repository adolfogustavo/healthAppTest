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
 private let healthStore = HKHealthStore()
 
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

  @objc 
  func createHKWorkout(_ activityType: String, 
                       startDate:Date,
                         endDate:Date,
               totalEnergyBurned:Float,
                   totalDistance:Float,
                    distanceUnit:String,
                    metadata: NSDictionary,
                    resolver resolve: @escaping (RCTPromiseResolveBlock), 
                    rejecter reject: @escaping (RCTPromiseRejectBlock)) {

    let energy = HKQuantity(unit: HKUnit.jouleUnit(with: .kilo), doubleValue: Double(totalEnergyBurned))
    let distance = HKQuantity(unit: self.obtainHKUnits(units: distanceUnit), doubleValue: Double(totalDistance))
    let metadataValues = metadata as! Dictionary<String,Any>
    let type = obtainHKWorkoutActivityType(activityType: activityType)
    let workout = HKWorkout(  activityType: type, 
                               start: startDate, 
                               end: endDate,
                               duration: 0,
                               totalEnergyBurned: energy, 
                               totalDistance: distance,
                               metadata: metadataValues as [String : Any])
    healthStore.save(workout) { (completion, error) in
      if (error != nil) {
        reject("error", "something went wrong", error);
      } else {
        resolve("workout was saved") 
      }
    }
  }
  
  func obtainHKUnits(units:String) -> HKUnit { 
    switch units {
    case "miles":
      return HKUnit.mile()
    default:
      return HKUnit.meter()
    }
  }
  
  func obtainHKWorkoutActivityType(activityType: String) -> HKWorkoutActivityType {
    switch activityType {
    case "fencing":
      return HKWorkoutActivityType.fencing
    case "cycling":
      return HKWorkoutActivityType.cycling
    default:
      return HKWorkoutActivityType.running
    }
  }

}
