//
//  StockChartData.swift
//  StockApi
//
//  Created by wegie on 2016/05/01.
//  Copyright © 2016年 wegie. All rights reserved.
//

import UIKit

public struct StockChartData {

    public let stockKey: StockKey
    public let barType: BarType
    public let barData: [BarData]

    init(stockKey: StockKey, barType: BarType, barData: [BarData]) {
        self.stockKey = stockKey
        self.barType = barType
        self.barData = barData
    }

}
