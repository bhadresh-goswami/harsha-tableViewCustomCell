//
//  InfoTableViewCell.swift
//  tableViewCustomCell
//
//  Created by Mac on 06/02/19.
//  Copyright © 2019 bhadresh. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var btnDetails: UIButton!
    @IBOutlet weak var lblCourse: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellImage.layer.cornerRadius = 5.00;
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
