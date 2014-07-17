//
//  collectionCell.swift
//  ibeaconSearch
//
//  Created by gabriel arronte on 7/17/14.
//  Copyright (c) 2014 Make and Build. All rights reserved.
//

import Foundation
import UIKit

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet var beaconName: UILabel
    
    init(frame: CGRect) {
        super.init(frame: frame)
    }
}