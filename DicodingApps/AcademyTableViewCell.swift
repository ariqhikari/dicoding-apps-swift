//
//  AcademyTableViewCell.swift
//  DicodingApps
//
//  Created by Ariq Hikari on 03/04/23.
//

import UIKit

class AcademyTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var academyLabel: UILabel!
    @IBOutlet weak var academyImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
