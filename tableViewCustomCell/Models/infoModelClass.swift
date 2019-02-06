//
//  infoModelClass.swift
//  tableViewCustomCell
//
//  Created by Mac on 06/02/19.
//  Copyright © 2019 bhadresh. All rights reserved.
//

import Foundation
import UIKit

struct InfoModel {
    var name:String = ""
    var course:String = ""
    var cellImage:String = "img_"
    init() {
        
    }

    init(name:String,course:String,cellImage:String) {
        self.name = name
        self.course = course
        self.cellImage = cellImage
    }
}
