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
    var getSales = String()
    var getCompany = String()
    var getYear = String()
    var selectedRowIndex : Int = Int()

    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Sales: UILabel!
    @IBOutlet weak var Company: UILabel!
    @IBOutlet weak var Year: UILabel!
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var salesTitle: UILabel!
    @IBOutlet weak var companyTitle: UILabel!
    
    @IBOutlet weak var yearTitle: UILabel!
    
    override func viewDidLoad() {
        UIsetUp()
        super.viewDidLoad()
        Name.text! =  getName
        Sales.text! =  getSales
        Company.text! = getCompany
        Year.text! = getYear
         print("selected : ", selectedRowIndex)
    }
    
    @IBAction func trashAction(_ sender: UIBarButtonItem) {

        
        let itemStore = ItemStore()

       
        let title = "Delete ()?"
        let message = "Are you sure you want to delete this item?"
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(cancelAction)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
            itemStore.allItems.remove(at: self.selectedRowIndex)
            itemStore.saveChanges()
            self.navigationController?.popViewController(animated: true)
        })
        ac.addAction(deleteAction)
        present(ac, animated: true, completion: nil)

        
        
      
    }
    func UIsetUp(){
        nameTitle.backgroundColor = UIColor.white
        nameTitle.layer.shadowColor = UIColor.lightGray.cgColor
        nameTitle.layer.shadowOpacity = 1;
        nameTitle.layer.shadowRadius = 2.0;
        
        Name.backgroundColor = UIColor.white
        Name.layer.shadowColor = UIColor.lightGray.cgColor
        Name.layer.shadowOpacity = 1;
        Name.layer.shadowRadius = 2.0;
        
        salesTitle.backgroundColor = UIColor.white
        salesTitle.layer.shadowColor = UIColor.lightGray.cgColor
        salesTitle.layer.shadowOpacity = 1;
        salesTitle.layer.shadowRadius = 2.0;
        
        Sales.backgroundColor = UIColor.white
        Sales.layer.shadowColor = UIColor.lightGray.cgColor
        Sales.layer.shadowOpacity = 1;
        Sales.layer.shadowRadius = 2.0;
        
        companyTitle.backgroundColor = UIColor.white
        companyTitle.layer.shadowColor = UIColor.lightGray.cgColor
        companyTitle.layer.shadowOpacity = 1;
        companyTitle.layer.shadowRadius = 2.0;
        
        Company.backgroundColor = UIColor.white
        Company.layer.shadowColor = UIColor.lightGray.cgColor
        Company.layer.shadowOpacity = 1;
        Company.layer.shadowRadius = 2.0;
        
        yearTitle.backgroundColor = UIColor.white
        yearTitle.layer.shadowColor = UIColor.lightGray.cgColor
        yearTitle.layer.shadowOpacity = 1;
        yearTitle.layer.shadowRadius = 2.0;
        
        Year.backgroundColor = UIColor.white
        Year.layer.shadowColor = UIColor.lightGray.cgColor
        Year.layer.shadowOpacity = 1;
        Year.layer.shadowRadius = 2.0;
        
        
        
        
        
    }


}
