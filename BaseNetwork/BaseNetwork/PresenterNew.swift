//
//  PresenterNew.swift
//  BaseNetwork
//
//  Created by SonNV MacMini on 15/06/2021.
//

import Foundation
import RxSwift

protocol PassDelegate: AnyObject {
    func onShowProgress()
    func onDismissProgress()
    func getText(_ text: String)
}

class PresenterNew {

    weak var delegate: PassDelegate?
    var service: ListLectureAPI!

    let disposeBag = DisposeBag()

    init(view: PassDelegate, service: ListLectureAPI) {
        self.delegate = view
        self.service = service
        self.loadAPI()
    }

    func loadAPI() {
        self.delegate?.onShowProgress()
        service.request().subscribe { list in
            print(list)
            let value = list.map({$0.fullName ?? ""}).joined(separator: "\n")
            self.delegate?.getText(value)
            self.delegate?.onDismissProgress()
        } onCompleted: {
            print("Done")
            self.delegate?.onDismissProgress()
        }.disposed(by: disposeBag)
    }
}
