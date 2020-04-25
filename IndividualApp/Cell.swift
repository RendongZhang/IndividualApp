//
//  Cell.swift
//  IndividualApp
//
//  Created by Rendong Zhang on 3/28/20.
//  Copyright © 2020 Rendong Zhang. All rights reserved.
//

import Foundation
import UIKit

class Cell: UITableViewCell{
 
    @IBOutlet weak var Name: UILabel!
    
    @IBOutlet weak var Company: UILabel!
    @IBOutlet weak var NumPlayers: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
