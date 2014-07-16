//
//  Beacon.swift
//  ibeaconSearch
//
//  Created by gabriel arronte on 7/15/14.
//  Copyright (c) 2014 Make and Build. All rights reserved.
//

import Foundation
import CoreBluetooth
import CoreLocation

let regionDeviceBeaconIdentifier = "com.makeandbuild.BeaconRegionIdentifier"
var transmitter: Beacon? = nil

class Beacon: NSObject, CBPeripheralManagerDelegate {
    // Properties
    var manager: CBPeripheralManager
    var beaconRegion: CLBeaconRegion
    
    
    // Singleton Beacon
    class func deviceBeacon() -> Beacon {
        if !transmitter {
            transmitter = Beacon()
        }
        
        return transmitter!
    }
    
    
    // Init
    init()  {
        self.manager = CBPeripheralManager()
        self.beaconRegion = CLBeaconRegion()
        super.init()
    }
    
    
    // Set Up
    func setUpBeacon(proximityUUID uuid:NSUUID?, major M:CLBeaconMajorValue?, minor m:CLBeaconMinorValue?, identifier i:String?) {
        self.beaconRegion = CLBeaconRegion(proximityUUID: uuid ? uuid : NSUUID(), major: M!, minor: m!, identifier: i ? i : regionDeviceBeaconIdentifier)
    }
    
    
    // Transmitting
    func startTransmitting() {
        self.manager = CBPeripheralManager(delegate: self, queue: nil)
    }
    
    func stopTransmitting() {
        self.manager.delegate = nil
    }
    
    
    // CBPeripheralManager Delegate
    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager!) {
        if peripheral.state == CBPeripheralManagerState.PoweredOn {
            self.manager.startAdvertising(self.beaconRegion.peripheralDataWithMeasuredPower(nil))
        }
        else if peripheral.state == CBPeripheralManagerState.PoweredOff {
            self.manager.stopAdvertising()
        }
    }
}
