//
//  BarType.swift
//  StockApi
//
//  Created by wegie on 2016/05/01.
//  Copyright © 2016年 wegie. All rights reserved.
//

import Foundation

public enum BarType {
    case Min5, Min15, Min30
    case Hour1, Hour4
    case Day1
}

extension BarType {

    var stringValue: String {
        switch self {
        case .Min5:
            return "5m"
        case .Min15:
            return "15m"
        case .Min30:
            return "30m"
        case .Hour1:
            return "1h"
        case .Hour4:
            return "4h"
        case .Day1:
            return "1d"
        }
    }

}
