//
//  ListLectureAPI.swift
//  BaseNetwork
//
//  Created by Sonnv on 14/06/2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class ListLectureAPI: API<[Repository]> {

//    var lectureRequest: String
//
//    init(lectureRequest: String) {
//        self.lectureRequest = lectureRequest
//    }

    override func path() -> String {
        return "search/repositories"
    }

    // method of the ListLectureAPI api
    override func method() -> HTTPMethod {
        return .get
    }

    // parameters of the ListLectureAPI api
    override func params() -> Parameters {
        var queryParameters: [String: Any] = ["sort": "stars", "order": "desc", "page": 1]
        queryParameters["q"] = "language:Swift"
        return queryParameters
    }

    // encoding of the ListLectureAPI api
    override func encoding() -> Alamofire.ParameterEncoding {
        return URLEncoding.default
    }

    // parser result of ListLectureAPI api
    override func convertJson(_ val: Any) throws -> [Repository] {
        var listRet: [Repository] = []
        if let value = val as? NSDictionary, let listObj = value["items"] as? [NSDictionary] {
            listRet = listObj.map({Repository($0 as NSDictionary) })
        }

        return listRet
    }
}
