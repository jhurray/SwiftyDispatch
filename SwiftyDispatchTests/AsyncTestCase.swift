//
//  AsyncTestCase.swift
//  SwiftyDispatch
//
//  Created by Jeff Hurray on 5/2/16.
//  Copyright © 2016 jhurray. All rights reserved.
//

import XCTest

class AsyncTestCase: XCTestCase {
    
    typealias End = () -> ()
    func performAsyncTest(title: String, testBlock: (End) -> Void) {
        let expectation = expectationWithDescription("Async Test: \(title)")
        
        testBlock {
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5.0) { (error: NSError?) -> Void in
            if let error = error {
                XCTFail("Error: \(title) test timed out with error: \(error)")
            }
            else {
                print("Success: Async test \"\(title)\"")
            }
        }
    }

}
