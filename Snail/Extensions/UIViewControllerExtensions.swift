//  Copyright © 2016 Compass. All rights reserved.

#if os(iOS) || os(tvOS)
import UIKit
#else
import Foundation
#endif

extension UIViewController {
    private static var disposerKey = "com.compass.Snail.UIViewController.disposer"

    public var disposer: Disposer {
        if let disposer = objc_getAssociatedObject(self, &UIViewController.disposerKey) as? Disposer {
            return disposer
        }
        let disposer = Disposer()
        objc_setAssociatedObject(self, &UIViewController.disposerKey, disposer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return disposer
    }
}
