//
//  ViewController.swift
//  BaseNetwork
//
//  Created by Sonnv on 14/06/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ListLectureAPI().request().subscribe { list in
//            print(list.map({$0.fullName}))
        } onCompleted: {
            print("Done")
        }.dispose()
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
//        print(val)
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
