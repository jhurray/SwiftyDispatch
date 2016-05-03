//
//  Extensions.swift
//  SwiftyDispatch
//
//  Created by Jeff Hurray on 5/2/16.
//  Copyright © 2016 jhurray. All rights reserved.
//

import Foundation

internal func dispatchTime(seconds: NSTimeInterval) -> dispatch_time_t {
    return dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
}
