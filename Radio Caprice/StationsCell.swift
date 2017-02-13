//
//  StationsCell.swift
//  Radio Caprice
//
//  Created by Simo on 11.02.17.
//  Copyright © 2017 Simo. All rights reserved.
//

import UIKit

class StationsCell: UITableViewCell {

    @IBOutlet weak var lock: UIImageView!
    @IBOutlet weak var subGenre: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
