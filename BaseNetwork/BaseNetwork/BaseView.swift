//
//  BaseView.swift
//  BaseNetwork
//
//  Created by SonNV MacMini on 15/06/2021.
//

import Foundation

@objc protocol BaseView {
    @objc func handleError(_ error: Error, option: Any?)
    @objc func onLogoutCompleted()
    @objc optional func onReloadSection(_ data: Any)
    @objc optional func pullRefreshed()
    @objc optional func onPullRefresh()
    @objc optional func onShowProgress()
    @objc optional func onDismissProgress()
}
