//
//  DetailsViewController.swift
//  ibeaconSearch
//
//  Created by gabriel arronte on 7/17/14.
//  Copyright (c) 2014 Make and Build. All rights reserved.
//

import UIKit
import CoreLocation

class DetailsViewController: UIViewController {
    
    @IBOutlet var beaconName: UILabel
    @IBOutlet var majorLabel: UILabel
    @IBOutlet var minorLabel: UILabel
    @IBOutlet var rssiLabel: UILabel
    var selectedBeacon: CLBeacon!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.beaconName.text = "UUID: \(selectedBeacon.proximityUUID.UUIDString)"
         self.majorLabel.text = "Major: \(selectedBeacon.major.integerValue)"
         self.minorLabel.text = "Minor: \(selectedBeacon.minor.integerValue)"
         self.rssiLabel.text =  "RSSI: \(selectedBeacon.rssi as Int)"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

