//
//  DispatchQueue.swift
//  SwiftyDispatch
//
//  Created by Jeff Hurray on 5/2/16.
//  Copyright © 2016 jhurray. All rights reserved.
//

import Foundation

public class DispatchQueue {
    
    internal let underlyingQueue: dispatch_queue_t
    
    public init(type: QueueType) {
        self.underlyingQueue = type.queue()
    }
    
    public func async(execute: Void -> Void) {
        dispatch_async(self.underlyingQueue, execute)
    }
    
    public func sync(execute: Void -> Void) {
        dispatch_sync(self.underlyingQueue, execute)
    }
    
    public func asyncBarrier(execute: Void -> Void) {
        dispatch_barrier_async(self.underlyingQueue, execute)
    }
    
    public func syncBarrier(execute: Void -> Void) {
        dispatch_barrier_sync(self.underlyingQueue, execute)
    }
    
    public func after(seconds: NSTimeInterval, execute: Void -> Void) {
        dispatch_after(dispatchTime(seconds), self.underlyingQueue, execute)
    }
    
    public func apply(iterations: Int, execute: (Int) -> Void) {
        dispatch_apply(iterations, self.underlyingQueue, execute)
    }
}
