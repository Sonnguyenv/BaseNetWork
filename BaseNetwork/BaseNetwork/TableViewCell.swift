//
//  TableViewCell.swift
//  BaseNetwork
//
//  Created by SonNV MacMini on 15/06/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var labelText: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
