//
//  QueueTests.swift
//  SwiftyDispatch
//
//  Created by Jeff Hurray on 5/2/16.
//  Copyright © 2016 jhurray. All rights reserved.
//

import XCTest
@testable import SwiftyDispatch

class QueueTests: AsyncTestCase {
    
    func testAsync() {
        self.performAsyncTest("Queue async") { end in
            let queue = DispatchQueue(type: .Custom(name: "q", style: .Serial))
            queue.async {
                end()
            }
        }
    }
    
    func testBarrier() {
        self.performAsyncTest("Queue barrier") { end in
            let queue = DispatchQueue(type: .Custom(name: "q", style: .Concurrent))
            queue.async {
                print("blah 1")
            }
            queue.async {
                print("blah 2")
            }
            queue.async {
                print("blah 3")
            }
            queue.async {
                print("blah 4")
            }
            queue.asyncBarrier {
                print("barrier")
                end()
            }
        }
    }
}
