//
//  QueueType.swift
//  SwiftyDispatch
//
//  Created by Jeff Hurray on 5/2/16.
//  Copyright © 2016 jhurray. All rights reserved.
//

import Foundation

public enum QueuePriority {
    
    case High
    case Default
    case Low
    case Background
    
    internal func priority() -> dispatch_queue_priority_t {
        switch self {
        case .High:
            return DISPATCH_QUEUE_PRIORITY_HIGH
        case .Default:
            return DISPATCH_QUEUE_PRIORITY_DEFAULT
        case .Low:
            return DISPATCH_QUEUE_PRIORITY_LOW
        case .Background:
            return DISPATCH_QUEUE_PRIORITY_BACKGROUND
        }
    }
}

public enum ExecutionStyle {
    case Serial
    case Concurrent
}

public enum QueueType {
    
    case Main
    case Global(priority: QueuePriority)
    case Custom(name: String, style: ExecutionStyle)
    
    internal func queue() -> dispatch_queue_t {
        switch self {
        case .Main:
            return dispatch_get_main_queue()
        case .Global(let priority):
            return dispatch_get_global_queue(priority.priority(), 0)
        case .Custom(let name, let style):
            switch style {
            case .Serial:
                return dispatch_queue_create(name, DISPATCH_QUEUE_SERIAL)
            case .Concurrent:
                return dispatch_queue_create(name, DISPATCH_QUEUE_CONCURRENT)
            }
        }
    }
    
}