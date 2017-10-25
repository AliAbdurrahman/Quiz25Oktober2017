//
//  NoteeTableViewCell.swift
//  QuizPhone
//
//  Created by Rizki Syaputra on 10/25/17.
//  Copyright © 2017 Rizki Syaputra. All rights reserved.
//

import UIKit

class NoteeTableViewCell: UITableViewCell {
    @IBOutlet weak var labelNamePhone: UILabel!
    
    @IBOutlet weak var labelModel: UILabel!
    @IBOutlet weak var labelBrand: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
