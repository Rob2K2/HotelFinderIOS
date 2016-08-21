//
//  HotelTableViewCell.swift
//  HotelFinder
//
//  Created by Roberto Merino on 20/8/16.
//  Copyright © 2016 Roberto Merino. All rights reserved.
//

import UIKit

class HotelTableViewCell: UITableViewCell {

    @IBOutlet weak var hotelNameLabel: UILabel!
    @IBOutlet weak var hotelImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
