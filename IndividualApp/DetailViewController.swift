//
//  DetailViewController.swift
//  IndividualApp
//
//  Created by Rendong Zhang on 3/28/20.
//  Copyright © 2020 Rendong Zhang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var getName = String()
    var getNumPlayers = String()
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var NumPlayers: UILabel!
    @IBOutlet weak var Company: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Name.text! = "Name :" + getName
        NumPlayers.text! = "Number of players : " + getNumPlayers
        Company.text! = "Company : RZ"
        // Do any additional setup after loading the view.
    }
    


}
