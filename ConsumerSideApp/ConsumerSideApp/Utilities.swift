//
//  Utilities.swift
//  ConsumerSideApp
//
//  Created by Frederik Lohner on 9/Mar/16.
//  Copyright © 2016 Writing. All rights reserved.
//

import Foundation

func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}