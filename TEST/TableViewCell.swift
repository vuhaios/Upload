//
//  TableViewCell.swift
//  TEST
//
//  Created by Vuha Sri on 12/26/18.
//  Copyright © 2018 Vuha Sri. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var alpha2: UILabel!
    
    @IBOutlet var alpha3: UILabel!
    
    @IBOutlet var subregion: UILabel!
    
    @IBOutlet var region: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
