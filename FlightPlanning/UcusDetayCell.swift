//
//  UcusDetayCell.swift
//  FlightPlanning
//
//  Created by Asilcan Çetinkaya on 30.08.2022.
//

import UIKit

class UcusDetayCell: UITableViewCell {
    @IBOutlet weak var ucusTuruLabel: UILabel!
    @IBOutlet weak var kabinAmiriLabel: UILabel!
    @IBOutlet weak var gidilecekAlanLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
