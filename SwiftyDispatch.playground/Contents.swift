//: Playground - noun: a place where people can play

import UIKit
import SwiftyDispatch

var str = "Hello, playground"

var main = DispatchQueue(type: .Main)

main.async {
    print("async")
}

let queue = DispatchQueue(type: .Custom(name: "my.queue", style: .Serial))

queue.async({
    print("async")
})

let group = DispatchGroup()
for i in 0...5 {
    group.async(queue, execute: {
        print("\(i)")
    })
}

group.notify(queue, execute: {
    print("done")
})
