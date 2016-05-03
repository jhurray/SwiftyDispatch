//
//  GroupTests.swift
//  SwiftyDispatch
//
//  Created by Jeff Hurray on 5/2/16.
//  Copyright © 2016 jhurray. All rights reserved.
//

import XCTest
@testable import SwiftyDispatch

class GroupTests: AsyncTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEnter() {
        
        self.performAsyncTest("Enter") { end in
            let queue = DispatchQueue(type: .Custom(name: "my.queue", style: .Serial))
            let group = DispatchGroup()
            group.enter()
            queue.async {
                group.leave()
            }
            group.notify(queue, execute: {
                end()
            })
        }
    }
    
    func testAsync() {
        
        self.performAsyncTest("Async") { end in
            let queue = DispatchQueue(type: .Custom(name: "my.queue", style: .Serial))
            let group = DispatchGroup()
            group.async(queue, execute: {
                print("ayyy")
            })
            group.notify(queue, execute: {
                end()
            })
        }
    }
    
    func testWait() {
        
        self.performAsyncTest("Wait") { end in
            let queue = DispatchQueue(type: .Custom(name: "my.queue", style: .Serial))
            let group = DispatchGroup()
            group.enter()
            queue.after(3.0, execute: {
                group.leave()
            })
            group.notify(queue, execute: {
                XCTFail()
            })
            group.wait(2.0)
            end()
        }
    }

}
