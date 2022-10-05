//
//  Controller.m
//  healthAppTest
//
//  Created by Gustavo Dominguez on 04-10-22.
//

#import "React/RCTBridgeModule.h"

// This exports our Controller class in Controller.swift 
@interface RCT_EXTERN_MODULE(Controller, NSObject)

// Exports our requestAuthorization method in the class
RCT_EXTERN_METHOD(requestAuthorization)

// Exports Function signature for a native method
RCT_EXTERN_METHOD(createHKWorkout:(NSString*)activityType
                  startDate:(NSDate*)startDate
                    endDate:(NSDate*)endDate
          totalEnergyBurned:(NSNumber*)totalEnergyBurned
              totalDistance:(NSNumber*)totalDistance
               distanceUnit:(NSString *)distanceUnit
                   metadata:(NSDictionary*)metadata
                   resolver:(RCTPromiseResolveBlock)resolve 
                   rejecter:(RCTPromiseRejectBlock)reject)

@end