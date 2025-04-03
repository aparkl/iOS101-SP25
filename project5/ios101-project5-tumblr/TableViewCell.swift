//
//  TableViewCell.swift
//  ios101-project5-tumblr
//
//  Created by Pro on 4/2/25.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        summaryLabel.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
