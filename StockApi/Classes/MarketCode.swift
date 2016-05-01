//
//  MarketCode.swift
//  StockApi
//
//  Created by wegie on 2016/05/01.
//  Copyright © 2016年 wegie. All rights reserved.
//

import Foundation

public enum MarketCode {

    case TSE, NSE, FSE, SSE

}

extension MarketCode {

    public var code: String {
        switch self {
        case .TSE:
            return "T"
        case .NSE:
            return "N"
        case .FSE:
            return "F"
        case .SSE:
            return "S"
        }
    }

}

extension MarketCode : CustomStringConvertible {
    public var description: String {
        return code
    }
}

extension MarketCode {

    static func of(code: String) -> MarketCode {
        switch code {
        case "T":
            return .TSE
        case "N":
            return .NSE
        case "F":
            return .FSE
        case "S":
            return .SSE
        default:
            fatalError()
        }
    }

}
