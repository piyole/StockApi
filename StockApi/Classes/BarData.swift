//
//  BarData.swift
//  StockApi
//
//  Created by wegie on 2016/05/01.
//  Copyright © 2016年 wegie. All rights reserved.
//

import Foundation

public class BarData {

    public let date: NSDate
    public let bar: Bar
    public let volume: Volume

    init(date: NSDate, bar: Bar, volume: Volume) {
        self.date = date
        self.bar = bar
        self.volume = volume
    }

}

extension BarData : CustomStringConvertible {

    public var description: String {
        return "\(date) : \(bar) \(volume))"
    }

}
