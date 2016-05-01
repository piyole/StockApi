//
//  Volume.swift
//  StockApi
//
//  Created by wegie on 2016/05/01.
//  Copyright © 2016年 wegie. All rights reserved.
//

import Foundation

public struct Volume {

    public let volume: Int?
    public let amount: Int?
    
    init(volume: Int?, amount: Int?) {
        self.volume = volume
        self.amount = amount
    }

}

extension Volume : CustomStringConvertible {

    public var description: String {
        return "\(volume ?? 0) \(amount ?? 0)"
    }

}
