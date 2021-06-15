//
//  ViewController.swift
//  BaseNetwork
//
//  Created by Sonnv on 14/06/2021.
//

import UIKit
import RxSwift

class ViewController: BaseVC, ListView {

    var datas: [String] = []

    @IBOutlet weak var tableView: UITableView!
//    var presenter: PresenterNew!
    var presenter: PresenterMain!

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.presenter.attachView(self)
//        presenter.delegate = self
//        self.presenter.loadAPI()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.presenter = PresenterNew(view: self, service: ListLectureAPI())
//        self.presenter = PresenterMain(view: self, service: ListLectureAPI())
        self.presenter = PresenterMain(view: self)
    }

    override func viewDidDisappear(_ animated: Bool) {
        self.presenter.detachView()
        super.viewDidDisappear(animated)
    }

    func getText(_ datas: [String]) {
        self.datas = datas
        self.tableView.reloadData()
    }

    @IBAction func push(_ sender: Any) {
        let vc = ViewController2(nibName: "ViewController2", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.labelText.text = datas[indexPath.row]
        return cell
    }
}
