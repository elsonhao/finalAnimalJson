//
//  MyTableViewCell.swift
//  finalAnimalJson
//
//  Created by 黃毓皓 on 2017/3/8.
//  Copyright © 2017年 ice elson. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var animalName: UILabel!
    
    @IBOutlet weak var animalImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
