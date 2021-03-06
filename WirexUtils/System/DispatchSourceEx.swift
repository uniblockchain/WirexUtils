//
//  DispatchSourceEx.swift
//  WirexUtils
//
//  Created by Eugen Fedchenko on 7/26/17.
//  Copyright © 2017 wirex. All rights reserved.
//

import Foundation

// https://github.com/mattgallagher/CwlUtils/blob/master/Sources/CwlUtils/CwlDispatch.swift

extension DispatchSource {
    
    public class func singleTimer(interval: DispatchTimeInterval,
                                  leeway: DispatchTimeInterval = .nanoseconds(0),
                                  queue: DispatchQueue = DispatchQueue.global(),
                                  handler: @escaping () -> Void) -> DispatchSourceTimer {
        
        let result = DispatchSource.makeTimerSource(queue: queue)
        
        result.setEventHandler(handler: handler)
        result.schedule(deadline: DispatchTime.now() + interval, leeway: leeway)
        result.resume()
        
        return result
    }
    
    public class func repeatingTimer(interval: DispatchTimeInterval,
                                     leeway: DispatchTimeInterval = .nanoseconds(0),
                                     queue: DispatchQueue = DispatchQueue.global(),
                                     handler: @escaping () -> Void) -> DispatchSourceTimer {
        
        let result = DispatchSource.makeTimerSource(queue: queue)
        
        result.setEventHandler(handler: handler)
        result.schedule(deadline: DispatchTime.now() + interval, repeating: interval, leeway: leeway)
        result.resume()
        
        return result
    }
}
