//
//  Presenter.swift
//  BaseNetwork
//
//  Created by SonNV MacMini on 15/06/2021.
//

import Foundation
import RxSwift

class PresenterMain {

    typealias T = ListView
    weak var view: ListView?

    let disposeBag = DisposeBag()

    var text: String = ""

    func detachView() {
        self.view = nil
    }

    init(view: ListView) {
        self.view = view
        self.loadAPI()
    }

    func loadAPI() {
        self.view?.onShowProgress?()
        ListLectureAPI().request().subscribe { list in
            print(list)
            let values = list.map({$0.fullName ?? ""})
            self.view?.getText(values)
            self.view?.onDismissProgress?()
        } onError: { Error in
            self.view?.handleError(Error, option: nil)
            self.view?.onDismissProgress?()
        } onCompleted: {
            print("Done")
            self.view?.onDismissProgress?()
        }.disposed(by: disposeBag)
    }
}

