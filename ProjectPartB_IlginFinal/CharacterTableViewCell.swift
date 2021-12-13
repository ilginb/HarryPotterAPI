//
//  CharacterTableViewCell.swift
//  ProjectPartB_IlginFinal
//
//  Created by Ilgin Bedir on 19/11/21.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
//Table view cell for characters fetched from API - Ilgin 19.11.21
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var picView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
