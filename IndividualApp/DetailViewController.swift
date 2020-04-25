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
    
    
    override func viewDidLoad() {
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


}
