//
//  AllOrderAPI.swift
//  BaseNetwork
//
//  Created by SonNV MacMini on 23/06/2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class AllOrderAPI: API<[Repository]> {
    override func path() -> String {
        return "/order/all-order/1"
    }

    override func method() -> HTTPMethod {
        return .get
    }

    override func encoding() -> Alamofire.ParameterEncoding {
        return URLEncoding.default
    }

    override func convertJson(_ val: Any) throws -> [Repository] {
        var listRet: [Repository] = []
        if let value = val as? NSDictionary, let listObj = value["items"] as? [NSDictionary] {
            listRet = listObj.map({Repository($0 as NSDictionary) })
        }
        return listRet
    }
}
