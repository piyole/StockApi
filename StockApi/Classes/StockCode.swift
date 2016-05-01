//
//  StockCode.swift
//  StockApi
//
//  Created by wegie on 2016/05/01.
//  Copyright © 2016年 wegie. All rights reserved.
//

import Foundation

public struct StockCode {

    public let code: String

}

extension StockCode : CustomStringConvertible {
    public var description: String {
        return code
    }
}