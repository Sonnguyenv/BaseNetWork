//
//  UIViewControllerExtention.swift
//  BaseNetwork
//
//  Created by SonNV MacMini on 15/06/2021.
//

import Foundation
import UIKit

class BaseVC: UIViewController, BaseView {

    let child = SpinnerViewController()
    
    func handleError(_ error: Error, option: Any?) {
        let dialogMessage = UIAlertController(title: "Errors",
                                              message: error.localizedDescription,
                                              preferredStyle: .alert)

        let action = UIAlertAction(title: "Ok", style: .default, handler: { (action)  in
            self.dismiss(animated: false, completion: nil)
         })
        dialogMessage.addAction(action)
        self.present(dialogMessage, animated: false, completion: nil)
    }

    func onLogoutCompleted() {
        print("onLogoutCompleted")
    }

    func onShowProgress() {
        // add the spinner view controller
        self.addChild(child)
        self.child.view.frame = view.frame
        self.view.addSubview(child.view)
        self.child.didMove(toParent: self)

    }

    func onDismissProgress() {
        self.child.willMove(toParent: nil)
        self.child.view.removeFromSuperview()
        self.child.removeFromParent()
    }
}
