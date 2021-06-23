//
//  ParamBuySellCoin.swift
//  BaseNetwork
//
//  Created by SonNV MacMini on 23/06/2021.
//

import UIKit

struct ParamBuySellCoin {
    var symbol, side, type, timeInForce: String?
    var quantity: Double?
    var price: Int?
    var newClientOrderId: String?

    init(_ symbol: String, _ side: String, _ type: String, _ timeInForce: String, _ quantity: Double, _ price: Int, _ newClientOrderId: String) {
        self.symbol = symbol
        self.side = side
        self.type = type
        self.timeInForce = timeInForce
        self.quantity = quantity
        self.price = price
        self.newClientOrderId = newClientOrderId
    }

    init() {}

    private enum Keys: String, CaseIterable {
        case symbol, side, type, timeInForce
        case quantity
        case price
    }

    func toJson() -> [String: Any] {
        var params = [String: Any]()
        params[Keys.symbol.rawValue] = self.symbol
        params[Keys.side.rawValue] = self.side
        params[Keys.type.rawValue] = self.type
        params[Keys.timeInForce.rawValue] = self.timeInForce
        params[Keys.quantity.rawValue] = self.quantity
        params[Keys.price.rawValue] = self.price
        return params
    }
}
