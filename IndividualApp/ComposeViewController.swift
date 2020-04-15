//
//  ComposeViewController.swift
//  IndividualApp
//
//  Created by Rendong Zhang on 4/15/20.
//  Copyright © 2020 Rendong Zhang. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var salesTF: UITextField!
    @IBOutlet weak var companyTF: UITextField!
    
    @IBOutlet weak var yearTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancelAction(_ sender: Any) {
        nameTF.resignFirstResponder()
        salesTF.resignFirstResponder()
        companyTF.resignFirstResponder()
        yearTF.resignFirstResponder()
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func saveAction(_ sender: Any) {
        nameTF.resignFirstResponder()
        salesTF.resignFirstResponder()
        companyTF.resignFirstResponder()
        yearTF.resignFirstResponder()
        let item = [nameTF.text!, salesTF.text!, companyTF.text!, yearTF.text!]
        vg.append(item)
        self.navigationController?.popViewController(animated: true)
        let vgViewController = self.navigationController?.topViewController as? VideoGameViewController
        vgViewController?.tableView?.reloadData()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

 

}
