//
//  CustomTableViewCell.swift
//  StretchMyHeader
//
//  Created by Alex Bearinger on 2017-02-14.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var headline: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
