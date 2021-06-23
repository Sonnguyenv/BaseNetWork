//
//  PresenterOder.swift
//  BaseNetwork
//
//  Created by SonNV MacMini on 23/06/2021.
//

import UIKit
import RxSwift

protocol OrderView: BaseView {
    func getText(_ datas: [String])
}

class PresenterOder: NSObject {
    weak var view: OrderView?
    let disposeBag = DisposeBag()

    init(view: OrderView) {
        super.init()
        self.view = view
    }

    func getAllOrder() {
        self.view?.onShowProgress?()
        AllOrderAPI().request().subscribe { list in
            print(list)
//            let value = list.map({$0.fullName ?? ""})
//            self.view?.getText(value)
            self.view?.onDismissProgress?()
        } onCompleted: {
            self.view?.onDismissProgress?()
        }.disposed(by: disposeBag)
    }

    func getHistoryOrder() {
        self.view?.onShowProgress?()
        HistoryOrderAPI().request().subscribe { list in
            print(list)
//            let value = list.map({$0.fullName ?? ""})
//            self.view?.getText(value)
            self.view?.onDismissProgress?()
        } onCompleted: {
            self.view?.onDismissProgress?()
        }.disposed(by: disposeBag)
    }

    func newBuyOrder(_ param: ParamBuySellCoin) {
        self.view?.onShowProgress?()
        NewBuyCoinAPI(param).request().subscribe { list in
            print(list)
//            let value = list.map({$0.fullName ?? ""})
//            self.view?.getText(value)
            self.view?.onDismissProgress?()
        } onCompleted: {
            self.view?.onDismissProgress?()
        }.disposed(by: disposeBag)
    }

    func newSellOrder(_ param: ParamBuySellCoin) {
        self.view?.onShowProgress?()
        NewSellCoinAPI(param).request().subscribe { list in
            print(list)
//            let value = list.map({$0.fullName ?? ""})
//            self.view?.getText(value)
            self.view?.onDismissProgress?()
        } onCompleted: {
            self.view?.onDismissProgress?()
        }.disposed(by: disposeBag)
    }
}
