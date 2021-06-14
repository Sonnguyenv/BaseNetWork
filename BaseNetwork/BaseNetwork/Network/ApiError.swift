//
//  ApiError.swift
//  BaseNetwork
//
//  Created by Sonnv on 14/06/2021.
//

import Foundation

class ApiError: Error {

    let error: ApiErrorResult
    let url: String
    let method: String
    let status: Int

    init(error: ApiErrorResult, url: String, method: String, status: Int) {
        self.error = error
        self.url = url
        self.method = method
        self.status = status
    }

}
