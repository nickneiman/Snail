//  Copyright © 2017 Compass. All rights reserved.

import Foundation

public class Subscriber<T>: DisposableType {
    let queue: DispatchQueue?
    let handler: (Event<T>) -> Void
    private(set) public weak var observable: Observable<T>?

    public init(queue: DispatchQueue?, observable: Observable<T>, handler: @escaping (Event<T>) -> Void) {
        self.queue = queue
        self.handler = handler
        self.observable = observable
    }

    public func dispose() {
        observable?.removeSubscriber(subscriber: self)
    }

    public func add(to disposer: Disposer) {
        disposer.add(disposable: self)
    }
}
