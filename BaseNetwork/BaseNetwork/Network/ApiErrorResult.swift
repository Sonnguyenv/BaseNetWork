//
//  ApiErrorResult.swift
//  BaseNetwork
//
//  Created by Sonnv on 14/06/2021.
//

import Foundation
import SwiftyJSON

class ApiErrorResult {
    var error: String?
    var errorDescription: String?
    var message: String?
    var errorCodes: Array<String>?

    init(_ val: Any) {
        let json = JSON(val)
        self.message = json["message"].string
        self.error = json["error"].string
        self.errorDescription = json["error_description"].string
        self.errorCodes = Array<String>()
        if let codes = json["error_codes"].array {
            for code in codes {
                if let str = code.string {
                    self.errorCodes?.append(str)
                }
            }
        }
    }

    init(_ message: String? = nil, codes: [String]?) {
        self.message = message
        self.errorCodes = codes
    }
    init(_ message: String? = nil, errorDescription: String?) {
        self.error = message
        self.errorDescription = errorDescription
    }
}
