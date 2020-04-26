//
//  ComposeViewController.swift
//  IndividualApp
//
//  Created by Rendong Zhang on 4/15/20.
//  Copyright © 2020 Rendong Zhang. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var salesTitle: UILabel!
    @IBOutlet weak var companyTitle: UILabel!
    @IBOutlet weak var cancelButtonLB: UIButton!
    @IBOutlet weak var saveButtonLB: UIButton!
    @IBOutlet weak var yearTitle: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var salesTF: UITextField!
    @IBOutlet weak var companyTF: UITextField!
    
    @IBOutlet weak var yearTF: UITextField!
    
    var itemStore = ItemStore()
   
    override func viewDidLoad() {
        UIsetUp()
        super.viewDidLoad()

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

        itemStore.createItem(nameTF.text!, salesTF.text!, companyTF.text!, yearTF.text!)
        itemStore.saveChanges()
        
       

        self.navigationController?.popViewController(animated: true)
        let vgViewController = self.navigationController?.topViewController as? VideoGameViewController
        vgViewController?.tableView?.reloadData()
        
        
    }
    func UIsetUp(){
        nameTitle.backgroundColor = UIColor.white
        nameTitle.layer.shadowColor = UIColor.lightGray.cgColor
        nameTitle.layer.shadowOpacity = 1;
        nameTitle.layer.shadowRadius = 2.0;
        
        nameTF.backgroundColor = UIColor.white
        nameTF.layer.shadowColor = UIColor.lightGray.cgColor
        nameTF.layer.shadowOpacity = 1;
        nameTF.layer.shadowRadius = 2.0;
        
        salesTitle.backgroundColor = UIColor.white
        salesTitle.layer.shadowColor = UIColor.lightGray.cgColor
        salesTitle.layer.shadowOpacity = 1;
        salesTitle.layer.shadowRadius = 2.0;
        
        salesTF.backgroundColor = UIColor.white
        salesTF.layer.shadowColor = UIColor.lightGray.cgColor
        salesTF.layer.shadowOpacity = 1;
        salesTF.layer.shadowRadius = 2.0;
        
        companyTitle.backgroundColor = UIColor.white
        companyTitle.layer.shadowColor = UIColor.lightGray.cgColor
        companyTitle.layer.shadowOpacity = 1;
        companyTitle.layer.shadowRadius = 2.0;
        
        companyTF.backgroundColor = UIColor.white
        companyTF.layer.shadowColor = UIColor.lightGray.cgColor
        companyTF.layer.shadowOpacity = 1;
        companyTF.layer.shadowRadius = 2.0;
        
        yearTitle.backgroundColor = UIColor.white
        yearTitle.layer.shadowColor = UIColor.lightGray.cgColor
        yearTitle.layer.shadowOpacity = 1;
        yearTitle.layer.shadowRadius = 2.0;
        
        yearTF.backgroundColor = UIColor.white
        yearTF.layer.shadowColor = UIColor.lightGray.cgColor
        yearTF.layer.shadowOpacity = 1;
        yearTF.layer.shadowRadius = 2.0;
        
        cancelButtonLB.layer.borderColor = UIColor.systemRed.cgColor
        cancelButtonLB.layer.borderWidth = 1.5
        cancelButtonLB.layer.cornerRadius = 16
        saveButtonLB.layer.borderColor = UIColor.systemGreen.cgColor
        saveButtonLB.layer.borderWidth = 1.5
        saveButtonLB.layer.cornerRadius = 16
        
        
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

 

}
