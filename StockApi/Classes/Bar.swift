//
//  Bar.swift
//  StockApi
//
//  Created by wegie on 2016/05/01.
//  Copyright © 2016年 wegie. All rights reserved.
//

import Foundation

public struct Bar {

    public let open: Double?
    public let high: Double?
    public let low: Double?
    public let close: Double?

    init(open: Double?, high: Double?, low: Double?, close: Double?) {
        self.open = open
        self.high = high
        self.low = low
        self.close = close
    }

}

extension Bar : CustomStringConvertible {

    public var description: String {
        return "\(open ?? 0) \(high ?? 0) \(low ?? 0) \(close ?? 0)"
    }
    
}