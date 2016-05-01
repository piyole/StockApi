//
//  NameSpace.swift
//  StockApi
//
//  Created by wegie on 2016/05/01.
//  Copyright © 2016年 wegie. All rights reserved.
//

import CachedApi

enum NameSpace : CacheNameSpace {

    case Stock
    case BarData

    var name: String {
        switch self {
        case .Stock:
            return "Stock"
        case .BarData:
            return "BarData"
        }
    }

    var expirationSeconds: Int {
        switch self {
        case .Stock:
            return 60 * 60 * 4 // 4 hours
        case .BarData:
            return 5
        }
    }

}
