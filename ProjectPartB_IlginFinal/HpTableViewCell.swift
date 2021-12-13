//
//  HpTableViewCell.swift
//  ProjectPartB_IlginFinal
//
//  Created by Ilgin Bedir on 19/11/21.
//

import UIKit

class HpTableViewCell: UITableViewCell {
//View cell to display saved hp characters - Ilgin 19.11.2021
    @IBOutlet weak var picView: UIImageView!
    @IBOutlet weak var nameTextField: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
