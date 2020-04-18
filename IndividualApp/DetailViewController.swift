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
        // Do any additional setup after loading the view.
    }
    
    @IBAction func trashAction(_ sender: UIBarButtonItem) {
        var dataStore = UserDefaults.standard
        var vgArray = UserDefaults.standard.value(forKey: "vgArrs")as! [[String]]
        let currentRowIndex = UserDefaults.standard.value(forKey: "selectedRowIndex")as! Int
        
        let item = vgArray[currentRowIndex]
        let title = "Delete \(item[0])?"
        let message = "Are you sure you want to delete this item?"
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(cancelAction)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
            // remove the item from the store
            vgArray.remove(at: currentRowIndex)
            dataStore.set(vgArray, forKey: "vgArrs")
            
           dataStore.set(currentRowIndex, forKey: "deletedRowIndex")
      
            print("Delete row : ", currentRowIndex)
            self.navigationController?.popViewController(animated: true)
//

        })
        ac.addAction(deleteAction)
        present(ac, animated: true, completion: nil)
        
        
      
    }
    

}
