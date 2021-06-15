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
        queryParameters["q"] = "language:Swif"
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

class Repository: Codable {
    var name: String?
    var fullName: String?
    var description: String?

    enum CodingKeys: String, CodingKey {
        case name
        case description
        case fullName = "full_name"
    }

    init(_ val: NSDictionary) {
        self.name = val[CodingKeys.name.stringValue] as? String
        self.fullName = val[CodingKeys.fullName.stringValue] as? String
        self.description = val[CodingKeys.description.stringValue] as? String
    }
}

// MARK: - Decodable
//extension Repository: Decodable {
//  init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    name = try container.decode(String.self, forKey: .name)
//    fullName = try container.decode(String.self, forKey: .fullName)
//    description = try? container.decode(String.self, forKey: .description)
//  }
//}
