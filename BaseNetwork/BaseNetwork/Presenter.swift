//
//  Presenter.swift
//  BaseNetwork
//
//  Created by SonNV MacMini on 15/06/2021.
//

import Foundation

protocol Presenter {
    associatedtype T

    func attachView(_ view: T)
    func detachView()

}
