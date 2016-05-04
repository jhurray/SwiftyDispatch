# SwiftyDispatch
Lightweight syntax wrapper over GCD dispatch queues and dispatch groups


```swift
var main = DispatchQueue(type: .Main)

main.sync {
    print("sync")
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

group.enter()
group.async(queue, execute: {
    group.leave()
})

group.notify(queue, execute: {
    print("done")
})

```

##Carthage

Add the following to your cartfile

```
github "jhurray/SwiftyDispatch"
```
