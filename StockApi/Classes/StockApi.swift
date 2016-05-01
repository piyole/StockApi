//
//  StockApi.swift
//  StockApi
//
//  Created by wegie on 2016/05/01.
//  Copyright © 2016年 wegie. All rights reserved.
//

import Foundation

import Promise
import CachedApi

private class StockCacheKey : CacheKey {
}

public class StockApi : Api {

    private let stockCacheKey = StockCacheKey()

    public func requestStocks() -> Promise<[Stock]> {
        return request(NameSpace.Stock, key: stockCacheKey, StockRequest().requestStocks())
    }

    public func requestChartData(stockKey: StockKey) -> Promise<ChartData> {
        return request(NameSpace.BarData, key: stockKey, StockRequest().requestChartData(stockKey))
    }

}