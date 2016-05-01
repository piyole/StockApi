//
//  Stock.swift
//  StockApi
//
//  Created by wegie on 2016/05/01.
//  Copyright © 2016年 wegie. All rights reserved.
//

import Foundation

public struct Stock {

    public let stockKey: StockKey
    public let name: String

    init(code: String, marketCode: MarketCode, name: String) {
        self.stockKey = StockKey(stockCode: StockCode(code: code), marketCode: marketCode)
        self.name = name
    }

}

extension Stock : CustomStringConvertible {
    public var description: String {
        return "\(stockKey.stockCode)-\(stockKey.marketCode) : \(name)"
    }
}