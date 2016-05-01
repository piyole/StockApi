//
//  StockKey.swift
//  StockApi
//
//  Created by wegie on 2016/05/01.
//  Copyright © 2016年 wegie. All rights reserved.
//

import CachedApi

public class StockKey : CacheKey {

    public let stockCode: StockCode
    public let marketCode: MarketCode

    public init(stockCode: StockCode, marketCode: MarketCode) {
        self.stockCode = stockCode
        self.marketCode = marketCode
    }

}
