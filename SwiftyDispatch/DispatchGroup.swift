//
//  DispatchGroup.swift
//  SwiftyDispatch
//
//  Created by Jeff Hurray on 5/2/16.
//  Copyright © 2016 jhurray. All rights reserved.
//

import Foundation

public class DispatchGroup {
    
    internal let underlyingGroup: dispatch_group_t
    
    public init() {
        self.underlyingGroup = dispatch_group_create()
    }
    
    public func enter() {
        dispatch_group_enter(self.underlyingGroup)
    }
    
    public func leave() {
        dispatch_group_leave(self.underlyingGroup)
    }
    
    public func async(queue: DispatchQueue, execute: Void -> Void) {
        dispatch_group_async(self.underlyingGroup, queue.underlyingQueue, execute)
    }
    
    public func notify(queue: DispatchQueue, execute: Void -> Void) {
        dispatch_group_notify(self.underlyingGroup, queue.underlyingQueue, execute)
    }
    
    public func wait(seconds: NSTimeInterval) {
        dispatch_group_wait(self.underlyingGroup, dispatchTime(seconds))
    }
    
}