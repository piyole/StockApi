//
//  StockRequest.swift
//  StockApi
//
//  Created by wegie on 2016/05/01.
//  Copyright © 2016年 wegie. All rights reserved.
//

import JsonData
import Promise
import Alamofire
import AlamofireJsonData
import CachedApi

struct StockParser : HTTPResponseParser {

    var parse: NSData -> [Stock] {
        return {
            let rows = self.parseCSV($0, encoding: NSShiftJISStringEncoding,
                                     options: [.FirstLineDrop, .EmptyLineDrop])
            return rows.flatMap(self.parse)
        }
    }

    private func parse(data: [String]) -> Stock? {
        guard data.count >= 2 else {
            return nil
        }
        let stockKey = data[0].componentsSeparatedByString("-")
        return Stock(code: stockKey[0], marketCode: MarketCode.of(stockKey[1]), name: data[1])
    }

}

struct BarDataParser : HTTPResponseParser {

    var parse: NSData -> [BarData] {
        return {
            let rows = self.parseCSV($0, encoding: NSShiftJISStringEncoding,
                                     options: [.FirstLineDrop, .EmptyLineDrop])
            return rows.flatMap(self.parse)
        }
    }

    private func parse(data: [String]) -> BarData? {
        guard data.count == 8 else {
            return nil
        }
        if let date = datetime(data[0], time: data[1]) {
            return BarData(date: date, bar: bar(Array(data.dropFirst(2))), volume: volume(Array(data.dropFirst(4))))
        }
        return nil
    }

    private func datetime(date: String, time: String) -> NSDate? {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter.dateFromString(String(format: "%@ %@", date, time))
    }

    private func bar(data: [String]) -> Bar {
        return Bar(open: Double(data[0]), high: Double(data[1]), low: Double(data[2]), close: Double(data[3]))
    }

    private func volume(data: [String]) -> Volume {
        return Volume(volume: Int(data[0]), amount: Int(data[1]))
    }

}

class StockRequest : HTTPRequest {

    private static let Host = "http://k-db.com"

    private static let GetStock = HTTPRequestPath("/stocks")
    private static let GetBarData = HTTPRequestPath("/stocks/{stock}/{barType}")

    init() {
        super.init(host: StockRequest.Host)
    }

    func requestStocks() -> Promise<[Stock]> {
        return requestObject(.Get, path: StockRequest.GetStock, params: ["download" : "csv"], encoding: .URL, parser: StockParser())
    }

    func requestChartData(stockKey: StockKey, barType: BarType = .Min5) -> Promise<StockChartData> {
        var path = StockRequest.GetBarData
        path = path.param("stock", format: "%@-%@", stockKey.stockCode.code, stockKey.marketCode.code)
        path = path.param("barType", barType.stringValue)
        return requestObject(.Get, path: path, params: ["download" : "csv"], encoding: .URL, parser: BarDataParser())
        .then { barData in
            return StockChartData(stockKey: stockKey, barType: barType, barData: barData)
        }
    }

}
