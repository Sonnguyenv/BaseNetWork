//
//  PresenterNew.swift
//  BaseNetwork
//
//  Created by SonNV MacMini on 15/06/2021.
//

import Foundation
import RxSwift

protocol ListViewNew: BaseView {
    func getText(_ datas: [String])
}

class PresenterNew {

    weak var view: ListViewNew?
    let disposeBag = DisposeBag()

    init(view: ListViewNew) {
        self.view = view
        self.loadAPI()
    }

    func loadAPI() {
        self.view?.onShowProgress?()
        ListLectureAPI().request().subscribe { list in
            print(list)
            let value = list.map({$0.fullName ?? ""})
            self.view?.getText(value)
            self.view?.onDismissProgress?()
        } onCompleted: {
            print("Done")
            self.view?.onDismissProgress?()
        }.disposed(by: disposeBag)
    }
}
